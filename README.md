# PXVirt Armbian

English | [中文](README-zh.md)

Armbian-based Proxmox VE / PBS images for ARM development boards and TV boxes.

Build PVE/PBS pre-installed Armbian images via GitHub Actions, with auto network detection, SSH and vmbr0 bridge configuration.

## Directory Structure

```
pxvirt-armbian/
├── buildrootfs.sh                      # Core customization script (Armbian chroot hook)
├── isobuilder.sh                       # Legacy ISO builder (standalone)
├── scripts/
│   ├── pxvirt-network-setup            # First-boot network auto-detect script
│   └── pxvirt-network-setup.service    # Systemd oneshot service
├── docs/
│   ├── armbian-boards.md               # Supported Armbian boards
│   └── ophub-boards.md                 # Supported ophub TV box boards
└── .github/
    ├── scripts/
    │   ├── customize-image.sh          # Armbian chroot hook wrapper
    │   ├── prepare-userpatches.sh      # Assemble Armbian userpatches
    │   └── model_database.conf         # ophub board-to-platform mapping
    └── workflows/
        ├── build-armbian.yml           # Dev board build CI
        └── build-ophub-armbian.yml     # TV box build CI (ophub repackage)
```

## GitHub Actions Build

Trigger workflows manually via `workflow_dispatch`.

### Dev Board (Official Armbian)

| Parameter | Description | Example |
|-----------|-------------|---------|
| `board` | Armbian board name | `rock-5b` |
| `branch` | Kernel branch | `vendor` / `current` / `edge` |
| `release` | Debian release | `bookworm` / `trixie` |
| `product` | Product type | `pxvirt` / `pbs` |
| `hostname` | Hostname | `pxvirt` |
| `ip_address` | Static IP (IP/MASK,GATEWAY) | `192.168.1.100/24,192.168.1.1` |
| `root_password` | Root password (empty=passwordless) | `` |

> Full board list: [docs/armbian-boards.md](docs/armbian-boards.md)

### TV Box (ophub Repackage)

Builds an Armbian base image, then repackages it with [ophub/amlogic-s9xxx-armbian](https://github.com/ophub/amlogic-s9xxx-armbian).

| Parameter | Description | Example |
|-----------|-------------|---------|
| `amlogic_soc` | ophub board name, `_` separated | `s905x3` or `s905x3_s922x` |
| `armbian_kernel` | Kernel version (`stable`=defaults) | `stable` / `6.12.y` |
| `release` | Debian release | `bookworm` / `trixie` |
| `product` | Product type | `pxvirt` / `pbs` |
| `hostname` | Hostname | `pxvirt` |
| `ip_address` | Static IP (IP/MASK,GATEWAY) | `192.168.1.100/24,192.168.1.1` |
| `root_password` | Root password | `` |

> Full device list: [docs/ophub-boards.md](docs/ophub-boards.md)

## Network Configuration

Static IP is required (DHCP not supported, PVE needs actual IP in `/etc/hosts`).

On first boot, `pxvirt-network-setup.service` auto-detects the physical wired NIC and creates a standard PVE vmbr0 bridge (runs once, then self-deletes).

## Notes

- **PBS only supports trixie**. If `pbs` is selected with `bookworm`, it will be auto-corrected to `trixie`.
- **Ceph**: `squid` is installed by default.
- **SSH**: Root login and password authentication are enabled. Host keys are regenerated on first boot.

## Contact

- Email: service@lierfang.com
- WeChat: 梨儿方
- Website: https://www.lierfang.com
