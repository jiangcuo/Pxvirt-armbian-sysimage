#!/bin/bash
# pxvirt-armbian buildrootfs.sh
# Armbian customize-image.sh hook: install Proxmox VE / PBS inside chroot
set -e

###############################################################################
# Configuration
###############################################################################
PXVIRT_APT_KEY_URL="https://mirrors.lierfang.com/pxcloud/pxvirt/pveport.gpg"
PXVIRT_MIRROR="https://mirrors.lierfang.com/pxcloud"

# Read from env vars (passed by workflow), with defaults
PRODUCT="${PXVIRT_PRODUCT:-pxvirt}"          # pxvirt | pbs
CODENAME="${PXVIRT_CODENAME:-bookworm}"      # bookworm | trixie
HOSTNAME_SET="${PXVIRT_HOSTNAME:-pxvirt}"
IP_ADDRESS="${PXVIRT_IP:-dhcp}"
ROOT_PASSWORD="${PXVIRT_ROOT_PASSWORD:-}"
CEPH_RELEASE="${PXVIRT_CEPH:-squid}"          # reef | squid | quincy | empty=skip

# PBS only supports trixie
if [[ "$PRODUCT" == "pbs" && "$CODENAME" != "trixie" ]]; then
    CODENAME="trixie"
fi

###############################################################################
# Utility functions
###############################################################################
info()  { echo "[pxvirt] $*"; }
warn()  { echo "[pxvirt] WARN: $*" >&2; }
die()   { echo "[pxvirt] ERROR: $*" >&2; exit 1; }

###############################################################################
# APT source configuration
###############################################################################
setup_apt_sources() {
    info "Setting up pxvirt apt source (product=$PRODUCT, codename=$CODENAME)"

    # Download GPG key
    curl -fsSL "$PXVIRT_APT_KEY_URL" -o /etc/apt/trusted.gpg.d/pveport.gpg \
        || die "Failed to download apt key"

    # Add pxvirt source
    cat > /etc/apt/sources.list.d/pxvirt.list <<EOF
deb ${PXVIRT_MIRROR}/${PRODUCT} ${CODENAME} main
EOF

    # Ceph source (optional)
    if [[ -n "$CEPH_RELEASE" ]]; then
        case "$CEPH_RELEASE" in
            reef|squid|quincy)
                info "Adding Ceph $CEPH_RELEASE source"
                echo "deb ${PXVIRT_MIRROR}/${PRODUCT} ${CODENAME} ceph-${CEPH_RELEASE}" \
                    >> /etc/apt/sources.list.d/pxvirt.list
                ;;
            *) warn "Unknown Ceph release: $CEPH_RELEASE, skipping" ;;
        esac
    fi

    apt-get update || die "apt update failed"
}

###############################################################################
# Install PVE / PBS
###############################################################################
install_pve() {
    info "Installing Proxmox packages (product=$PRODUCT)"

    local main_pkg
    if [[ "$PRODUCT" == "pxvirt" ]]; then
        main_pkg="proxmox-ve"
    else
        main_pkg="proxmox-backup-server"
    fi

    local base_pkgs="postfix chrony locales locales-all ifupdown2 isc-dhcp-client \
        openssh-server ethtool dnsutils gdisk bash-completion \
        dosfstools lvm2 btrfs-progs zfsutils-linux zfs-zed spl zfs-initramfs \
        pci.ids pciutils efibootmgr net-tools traceroute \
        squashfs-tools rsyslog ksmtuned sosreport dmeventd \
        fonts-liberation gettext-base curl wget vim"

    DEBIAN_FRONTEND=noninteractive apt-get install -y \
        $main_pkg $base_pkgs \
        || die "Failed to install $main_pkg"

    # Ceph packages
    if [[ -n "$CEPH_RELEASE" ]]; then
        DEBIAN_FRONTEND=noninteractive apt-get install -y ceph-common ceph-fuse 2>/dev/null || true
    fi

    info "Proxmox packages installed"
}

###############################################################################
# Network firstboot setup
###############################################################################
setup_network_firstboot() {
    info "Setting up network firstboot service (IP_ADDRESS=$IP_ADDRESS)"

    local overlay_scripts="/tmp/overlay/scripts"

    # Base interfaces file (firstboot script will overwrite with full config)
    cat > /etc/network/interfaces <<'EOF'
auto lo
iface lo inet loopback
EOF

    # Install firstboot script and service from overlay
    cp "$overlay_scripts/pxvirt-network-setup" /usr/local/bin/
    chmod +x /usr/local/bin/pxvirt-network-setup

    cp "$overlay_scripts/pxvirt-network-setup.service" /etc/systemd/system/

    # Write env file so the script knows the IP config
    cat > /etc/default/pxvirt-network <<EOF
PXVIRT_IP=${IP_ADDRESS}
EOF

    systemctl enable pxvirt-network-setup.service
    info "Network firstboot service installed"
}

###############################################################################
# System configuration
###############################################################################
configure_system() {
    info "Configuring system"

    # Hostname
    echo "$HOSTNAME_SET" > /etc/hostname
    cat > /etc/hosts <<EOF
127.0.0.1   localhost
127.0.1.1   ${HOSTNAME_SET}

# IPv6
::1         localhost ip6-localhost ip6-loopback
ff02::1     ip6-allnodes
ff02::2     ip6-allrouters
EOF
    info "Hostname: $HOSTNAME_SET"

    # Network: firstboot service auto-detects NIC and creates vmbr0 bridge
    setup_network_firstboot

    # Root password
    if [[ -n "$ROOT_PASSWORD" ]]; then
        echo "root:${ROOT_PASSWORD}" | chpasswd
        info "Root password set"
    else
        passwd -d root
        info "Root password cleared (passwordless login)"
    fi

    # SSH: allow root login + password auth, regenerate host keys on first boot
    sed -i 's/^#\?PermitRootLogin.*/PermitRootLogin yes/' /etc/ssh/sshd_config
    sed -i 's/^#\?PasswordAuthentication.*/PasswordAuthentication yes/' /etc/ssh/sshd_config
    grep -q '^PermitRootLogin' /etc/ssh/sshd_config || echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config
    grep -q '^PasswordAuthentication' /etc/ssh/sshd_config || echo 'PasswordAuthentication yes' >> /etc/ssh/sshd_config

    # Remove host keys so they are regenerated on first boot
    rm -f /etc/ssh/ssh_host_*

    # Timezone
    ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
    echo "Asia/Shanghai" > /etc/timezone

    # Locale
    echo "locales locales/default_environment_locale select en_US.UTF-8" | debconf-set-selections
    echo "locales locales/locales_to_be_generated select en_US.UTF-8 UTF-8, zh_CN.UTF-8 UTF-8" | debconf-set-selections
    DEBIAN_FRONTEND=noninteractive dpkg-reconfigure locales 2>/dev/null || true
}

###############################################################################
# Remove Armbian branding
###############################################################################
de_armbian() {
    info "Removing Armbian branding"

    for svc in armbian-firstrun armbian-firstrun-config armbian-firstlogin \
               armbian-zram-config armbian-ramlog \
               armbian-led-state armbian-disk-health armbian-hardware-monitor \
               armbian-hardware-optimize; do
        systemctl disable "$svc" 2>/dev/null || true
        systemctl mask    "$svc" 2>/dev/null || true
    done

    rm -f /etc/update-motd.d/*armbian* /etc/profile.d/armbian-*.sh \
          /etc/profile.d/check_first_login*.sh
    rm -f /root/.not_logged_in_yet
    chage -d 99999 root 2>/dev/null || true


    # Remove conflicting network stacks (PVE uses ifupdown2)
    DEBIAN_FRONTEND=noninteractive apt-get purge -y \
        network-manager network-manager-gnome nmcli \
        netplan.io netplan-generator \
        systemd-networkd \
        armbian-config armbian-zsh 2>/dev/null || true
    rm -rf /etc/netplan /etc/NetworkManager
}

###############################################################################
# Cleanup
###############################################################################
cleanup() {
    info "Cleaning up cache"
    apt-get autoremove -y --purge 2>/dev/null || true
    apt-get clean
    rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/*.deb
}

###############################################################################
# Main entry — called by Armbian customize-image.sh
# Args: buildrootfs.sh armbian $RELEASE $LINUXFAMILY $BOARD $BUILD_DESKTOP $ARCH
###############################################################################
mode_armbian() {
    info "==> PXVIRT Armbian customization started"
    info "RELEASE=$2 LINUXFAMILY=$3 BOARD=$4 ARCH=$6"

    setup_apt_sources
    install_pve
    configure_system
    de_armbian
    cleanup

    info "==> PXVIRT Armbian customization completed"
}

###############################################################################
# Entry point
###############################################################################
MODE="${1:-armbian}"
case "$MODE" in
    armbian) mode_armbian "$@" ;;
    -h|--help)
        echo "Usage: $0 armbian [RELEASE LINUXFAMILY BOARD BUILD_DESKTOP ARCH]"
        echo "  Install PVE/PBS inside Armbian chroot"
        ;;
    *) echo "Unknown mode: $MODE"; exit 1 ;;
esac
