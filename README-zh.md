# PXVirt Armbian

[English](README.md) | 中文

基于 Armbian 的 Proxmox VE / PBS 镜像，支持 ARM 开发板和 TV Box。

通过 GitHub Actions 构建预装 PVE/PBS 的 Armbian 镜像，自动检测网络、配置 SSH 和 vmbr0 网桥。

## 目录结构

```
pxvirt-armbian/
├── buildrootfs.sh                      # 核心定制脚本（Armbian chroot 钩子）
├── isobuilder.sh                       # 旧版 ISO 构建器（独立使用）
├── scripts/
│   ├── pxvirt-network-setup            # 首次启动网络自动检测脚本
│   └── pxvirt-network-setup.service    # Systemd oneshot 服务
├── docs/
│   ├── armbian-boards.md               # 支持的 Armbian 开发板列表
│   └── ophub-boards.md                 # 支持的 ophub TV Box 列表
└── .github/
    ├── scripts/
    │   ├── customize-image.sh          # Armbian chroot 钩子包装器
    │   ├── prepare-userpatches.sh      # 组装 Armbian userpatches
    │   └── model_database.conf         # ophub 板型到平台映射表
    └── workflows/
        ├── build-armbian.yml           # 开发板构建 CI
        └── build-ophub-armbian.yml     # TV Box 构建 CI（ophub 重打包）
```

## GitHub Actions 构建

通过 `workflow_dispatch` 手动触发。

### 开发板（官方 Armbian）

| 参数 | 说明 | 示例 |
|------|------|------|
| `board` | Armbian 板型名 | `rock-5b` |
| `branch` | 内核分支 | `vendor` / `current` / `edge` |
| `release` | Debian 版本 | `bookworm` / `trixie` |
| `product` | 产品类型 | `pxvirt` / `pbs` |
| `hostname` | 主机名 | `pxvirt` |
| `ip_address` | 静态 IP（IP/掩码,网关） | `192.168.1.100/24,192.168.1.1` |
| `root_password` | root 密码（留空=无密码） | `` |

> 完整板子列表见 [docs/armbian-boards.md](docs/armbian-boards.md)

### TV Box（ophub 重打包）

先用 Armbian 构建基础镜像，再用 [ophub/amlogic-s9xxx-armbian](https://github.com/ophub/amlogic-s9xxx-armbian) 二次打包。

| 参数 | 说明 | 示例 |
|------|------|------|
| `amlogic_soc` | ophub board 名，多个用 `_` 分隔 | `s905x3` 或 `s905x3_s922x` |
| `armbian_kernel` | 内核版本（`stable`=默认） | `stable` / `6.12.y` |
| `release` | Debian 版本 | `bookworm` / `trixie` |
| `product` | 产品类型 | `pxvirt` / `pbs` |
| `hostname` | 主机名 | `pxvirt` |
| `ip_address` | 静态 IP（IP/掩码,网关） | `192.168.1.100/24,192.168.1.1` |
| `root_password` | root 密码 | `` |

> 完整设备列表见 [docs/ophub-boards.md](docs/ophub-boards.md)

## 网络配置

必须提供静态 IP（不支持 DHCP，PVE 需要在 `/etc/hosts` 中写入实际 IP）。

首次启动时 `pxvirt-network-setup.service` 自动检测物理有线网口，创建标准 PVE vmbr0 网桥（运行一次后自动删除）。

## 说明

- **PBS 仅支持 trixie**。如果选择 `pbs` + `bookworm`，会自动更正为 `trixie`。
- **Ceph**：默认安装 `squid` 版本。
- **SSH**：已启用 root 登录和密码认证。主机密钥在首次启动时重新生成。

## 联系方式

- 邮箱: service@lierfang.com
- 微信服务号: 梨儿方
- 官网: https://www.lierfang.com
