# ophub TV Box Board List

Source: [ophub/amlogic-s9xxx-armbian model_database.conf](https://github.com/ophub/amlogic-s9xxx-armbian/blob/main/build-armbian/armbian-files/common-files/etc/model_database.conf)

> Board name is used for the `amlogic_soc` parameter in `build-ophub-armbian.yml`, separate multiple with `_`.
>
> Batch shortcuts supported: `all` / `amlogic` / `rockchip` / `allwinner` / `first50` / `last50` / `range50_100`

### Available Kernel Versions

All boards default to `stable` tag. Current stable kernels:

| Kernel Version | Description |
|---------|------|
| `6.12.y` | Stable (recommended) |
| `6.18.y` | Latest |
| `6.6.y` | LTS |
| `6.1.y` | LTS |
| `5.15.y` | Legacy devices |
| `5.10.y` | Legacy devices |

> Separate multiple versions with `_`, e.g. `6.6.y_6.12.y`, each version generates a separate image.

---

## Amlogic

### a311d

| Board | Device |
|-------|------|
| `a311d` | Khadas-VIM3 |
| `a311d-oes` | WXY-OES |

### s922x

| Board | Device |
|-------|------|
| `s922x` | GT-King-Pro, X88-King |
| `s922x-ct2000` | Ali-CT2000 |
| `s922x-gtking` | GT-King |
| `s922x-gtkingpro-h` | GT-King-Pro-H |
| `s922x-odroid-n2` | ODroid-N2 |
| `s922x-oes-plus` | WXY-OES-Plus |
| `s922x-reva` | GT-King-Pro-Rev_A |
| `s922x-ugoos-am6` | UGOOS-AM6-Plus |

### s912

| Board | Device |
|-------|------|
| `s912` | Octopus-Planet, OneCloudPro, Tanix-TX9S |
| `s912-h96pro-plus` | H96-Pro-Plus, TX92, Z6-Plus |
| `s912-m8s-pro` | MECOOL-M8S-Pro-L, TX3-Mini |
| `s912-nexbox-a1` | Nexbox-A1, A95X |
| `s912-nexbox-a2` | Nexbox-A95X-A2 |
| `s912-onecloudpro` | OneCloudPro-V1.2 |
| `s912-onecloudpro-2` | OneCloudPro-V1.2 Flash-NewOS |
| `s912-phicomm-t1` | Phicomm-T1 |
| `s912-t95z-plus` | T95Z-Plus |
| `s912-tx8-max` | Tanix-TX8-MAX |
| `s912-tx9-pro-2g` | TX9-Pro (2G) |
| `s912-tx9-pro-3g` | TX9-Pro (3G) |
| `s912-x92` | Vontar-X92 |
| `s912-zyxq-fake` | Octopus-Planet (FAKE) |

### s905x3

| Board | Device |
|-------|------|
| `s905x3` | X96-Max+ (100Mb) |
| `s905x3-2101` | X96-Max+_2101 |
| `s905x3-a100` | X96-Max+_A100 |
| `s905x3-a95xf3` | A95XF3-Air (100Mb) |
| `s905x3-a95xf3-gb` | A95XF3-Air (1Gb) |
| `s905x3-b` | Tencent-Aurora-3Pro |
| `s905x3-h96max` | H96-Max-X3, Infinity-B32 |
| `s905x3-h96max-oc` | H96-Max-X3 (OverClock) |
| `s905x3-hk1` | HK1-Box, Vontar-X3 |
| `s905x3-hk1-oc` | HK1-Box (OverClock) |
| `s905x3-ip1001m` | X96-Max+ (IP1001M) |
| `s905x3-q1` | X96-Max+Q1 |
| `s905x3-q2` | X96-Max+Q2, X96-Air-Q1000 |
| `s905x3-tox1` | TOX1 |
| `s905x3-tx3` | TX3 (1Gb) |
| `s905x3-tx3-bz` | TX3 (100Mb) |
| `s905x3-tx3-bz-oc` | TX3 (100Mb, OverClock) |
| `s905x3-tx3-oc` | TX3 (1Gb, OverClock) |
| `s905x3-ugoosx3` | Ugoos-X3 |
| `s905x3-ugoosx3-oc` | Ugoos-X3 (OverClock) |
| `s905x3-whale` | Whale |
| `s905x3-x88-pro-x3` | X88-Pro-X3, X99-Max+, Transpeed-X3+ |
| `s905x3-x96air` | X96-Air, X96-Max+100W |
| `s905x3-x96air-gb` | X96-Air (1Gb) |
| `s905x3-x96max` | X96-Max+ (1GB) |
| `s905x3-x96max-oc` | X96-Max+ (OverClock) |
| `s905d3-khadas-vim3l` | Khadas-VIM3L |

### s905x2

| Board | Device |
|-------|------|
| `s905x2` | X96-Max (4GB), Tx5-Max |
| `s905x2-hg680fj` | HG680-FJ |
| `s905x2-km3` | MECOOL-KM3 (4G) |
| `s905x2-x96max-2g` | X96-Max (2GB), A95X-F2 |

### s905x

| Board | Device |
|-------|------|
| `s905x` | HG680P |
| `s905x-b860h` | B860H |
| `s905x-nexbox-a95x` | Nexbox-a95x |
| `s905x-t95` | T95, XiaoMI-3S, X96, BTV9 |
| `s905x-tbee` | TBee |
| `s905x-tx9` | TX9 |

### s905w

| Board | Device |
|-------|------|
| `s905w` | TX3-Mini, MeCool-m8s-pro-W |
| `s905w-w95` | W95 |
| `s905w-x96-mini` | X96-Mini |
| `s905w-x96w` | X96W, FunTV, MXQ-Pro-4K |

### s905d

| Board | Device |
|-------|------|
| `s905d` | MECOOL-KI-Pro, Phicomm-N1 |
| `s905d-ki-pro` | MECOOL-KI-Pro |
| `s905d-n1-thresh` | Phicomm-N1 |
| `s905d-sml5442tw` | SML-5442TW |

### s905

| Board | Device |
|-------|------|
| `s905` | Beelink-Mini-MX (2G) |
| `s905-beelink-mini` | Beelink-Mini-MX |
| `s905-mxqpro-plus` | MXQ-Pro+4K, SumaVision-Q5 |

### s905l / s905l2 / s905l3 / s905l3a / s905l3b / s905lb / s905mb

| Board | SOC | Device |
|-------|-----|------|
| `s905l` | s905l | MiBox-4, MiBox-4C, MG101, E900V21C |
| `s905l-aurora-1s` | s905l | Tencent-Aurora-1s, B860AV2.1 |
| `s905l-b860av21u` | s905l | B860AV2.1U, HM201 |
| `s905l-mg101` | s905l | MG101, Mibox-4, E900V21C, XiaoMI-4C |
| `s905l2` | s905l2 | MGV2000, MGV3000, M301A |
| `s905l2-e900v21e` | s905l2 | E900v21E, MGV2000-K |
| `s905l2-wojia` | s905l2 | Wojia-TV-IPBS9505 |
| `s905l3` | s905l3 | CM311-1, HG680-LC, M401A, UNT402A |
| `s905l3-cm211` | s905l3 | CM211-1, M411A, B860AV3.2M |
| `s905l3-unt400g1` | s905l3 | UNT400G1, E900V22D-2 |
| `s905l3-unt402a` | s905l3 | UNT402A, UNT400G |
| `s905l3a` | s905l3a | E900V22C-D, CM311-1a-CH, IP112H |
| `s905l3a-cm311` | s905l3a | CM311-1a-YST |
| `s905l3a-m401a` | s905l3a | M401A, UNT403A, B863AV3.2-M |
| `s905l3b` | s905l3b | M302A, M304A, CM201-1, CM211-1, CM311-1 |
| `s905l3b-e900v21d` | s905l3b | E900V21D, B860AV2.1-A |
| `s905l3b-e900v22d` | s905l3b | E900V22D, TY1608 |
| `s905l3b-e900v22e` | s905l3b | E900V21E, E900V22E, MGV2000 |
| `s905l3b-ip103h` | s905l3b | IP103H, TY1608, BV310 |
| `s905l3b-rg020et-ca` | s905l3b | RG020ET-CA |
| `s905l3b-unt403a` | s905l3b | UNT403A |
| `s905lb-r3300l` | s905lb | BesTV-R3300L, SumaVision-Q7, MG101 |
| `s905lb-q96-mini` | s905lb | Q96-mini |
| `s905lb-ipbs9505` | s905lb | IPBS9505 |
| `s905mb` | s905mb | S65 |

---

## Rockchip

### rk3588 / rk3588s

| Board | SOC | Device |
|-------|-----|------|
| `cm3588-nas` | rk3588 | FriendlyElec-CM3588-NAS |
| `dc-a588` | rk3588 | DC-A588 |
| `easepi-r2` | rk3588 | EasePi-R2 |
| `firefly-itx-3588j` | rk3588 | Firefly-ITX-3588J |
| `h88k` | rk3588 | HLink-H88K |
| `h88k-v3` | rk3588 | HLink-H88K-V3 |
| `ipc-r` | rk3588 | IPC-R |
| `lz-d3588` | rk3588 | LZ-D3588 |
| `nanopc-t6` | rk3588 | NanoPC-T6 |
| `orangepi-5-plus` | rk3588 | Orange-Pi-5-Plus |
| `rock-5-itx` | rk3588 | Rock-5-ITX |
| `rock5b` | rk3588 | Rock5B |
| `seewo-sv50` | rk3588 | Seewo-SV50 |
| `smart-am60` | rk3588 | Smart-Am60 |
| `boca-tcn100` | rk3588s | Boca-tcn100 |
| `boca-tcn200` | rk3588s | Boca-tcn200 |
| `indiedroid-nova` | rk3588s | Indiedroid-Nova |
| `lubancat-4` | rk3588s | LubanCat-4 |
| `orangepi-5-pro` | rk3588s | Orange-Pi-5-Pro |
| `orangepi-5b` | rk3588s | Orange-Pi-5B |
| `rock5c` | rk3588s | Rock5C |

### rk3576

| Board | Device |
|-------|------|
| `lckfb-tspi-3m` | LCKFB-Taishan-Pi-3M |
| `nanopi-m5` | NanoPi-m5 |

### rk3568

| Board | Device |
|-------|------|
| `alark35-3500` | Alark35-3500 |
| `anas3035` | MMBox-Anas3035 |
| `bdkj-bd-one` | BDKJ-One |
| `bdy-g18-pro` | BDY-G18-Pro |
| `dg-tn3568` | DG-TN3568 |
| `e25` | Radxa-E25 |
| `easepi-a2` | EasePi-A2 |
| `gzpeite-p01` | Gzpeite-P01 |
| `h66k` | HLink-H66K |
| `h68k` | HLink-H68K |
| `h69k` | HLink-H69K |
| `lubancat-2` | LubanCat-2 |
| `lyt-t68m` | Lyt-t68m |
| `lz-d3568` | LZ-D3568 |
| `lz-k3568` | LZ-K3568 |
| `mrkaio-m68s` | Mrkaio-m68s |
| `nanopi-r5c` | NanoPi-R5C |
| `nanopi-r5s` | NanoPi-R5S |
| `nsy-g16-plus` | NSY-G16-Plus |
| `nsy-g68-plus` | NSY-G68-Plus |
| `photonicat` | Photonicat |
| `r66s` | FastRhino-R66S |
| `r68s` | FastRhino-R68S |
| `rock-3b` | Rock-3B |
| `ruisen-box` | Ruisen-box |
| `seewo-sv21` | Seewo-sv21 |
| `station-p2` | Station-P2 |
| `swan1-w28` | Swan1-w28 |
| `wocyber-a3` | Wocyber-A3 |

### rk3566

| Board | Device |
|-------|------|
| `jp-tvbox` | JP-TvBox |
| `lckfb-tspi` | LCKFB-Taishan-Pi |
| `lubancat-1` | LubanCat-1 |
| `orangepi-3b` | Orange-Pi-3B |
| `panther-x2` | Panther-X2 |
| `rock-3c` | Rock-3C |
| `station-m2` | Station-M2 |
| `wxy-oect` | WXY-OEC-turbo (original) |
| `wxy-oect-mod` | WXY-OEC-turbo (modified) |
| `x88pro20` | X88Pro20 |

### rk3528

| Board | Device |
|-------|------|
| `cd1000` | Inspur-CD1000 |
| `e20c` | Radxa-E20C |
| `h28k` | HLink-H28K |
| `h96-max-m2` | H96-Max-M2 |
| `hk1-rbox-k8s` | HK1-Rbox-K8S |
| `ht2` | HT2 |

### rk3399

| Board | Device |
|-------|------|
| `aio-3399b` | AIO-3399b |
| `aio-3399c` | AIO-3399C |
| `aio-3399c-ai` | AIO-3399C (AI) |
| `crrc` | CRRC |
| `dg3399` | DG-3399 |
| `dlfr100` | Dilusense-DLFR100 |
| `eaidk-610` | EAIDK-610 |
| `emb3531` | EMB3531 |
| `fine3399` | Fine3399 |
| `firefly-jd4` | Firefly-Core-3399-JD4 |
| `firefly-rk3399` | Firefly-RK3399 |
| `fmx1-pro` | Fmx1-Pro |
| `fmx1-pro-b` | Fmx1-Pro-B |
| `gea-6319` | GEA-6319 |
| `hs530r` | Hisense-hs530r |
| `hugsun-x99` | Hugsun-X99 |
| `king3399` | King3399 |
| `kylin3399` | Kylin3399 |
| `leez` | Leez-P710 |
| `lx-r3s` | LX-R3S |
| `nanopc-t4` | NanoPC-T4 |
| `smart-am40` | SMART-AM40 |
| `sv-33a6x` | Sv-33a6x |
| `sv-33a6x-vpu` | Sv-33a6x (VPU) |
| `sw799` | SW799 |
| `taram` | TaraM |
| `tb-ls3399` | Tb-ls3399 |
| `tn3399` | TN3399 |
| `tpm312` | Tpm312 |
| `tvi3315a` | tvi3315a |
| `xiaobao` | xiaobao |
| `yskj` | YSKJ |
| `zcube1-max` | ZCube1-Max |
| `zk-r39a` | ZK-rk39a |
| `zysj` | ZYSJ |

### rk3328

| Board | Device |
|-------|------|
| `beikeyun` | BeikeYun |
| `chainedbox` | Chainedbox-L1-Pro |
| `renegade-rk3328` | Renegade, Firefly-RK3328 |
| `station-m1` | Station-M1, Bqeel-MVR9 |

### rk3318

| Board | Device |
|-------|------|
| `rk3318-box` | RK3318-Box |

---

## Allwinner

### h6

| Board | Device |
|-------|------|
| `vplus` | Vplus-Cloud |
| `tanix-tx6` | Tanix-TX6, T95-max |
| `tqc-a01` | TaiqiCat-A01 |

### h618

| Board | Device |
|-------|------|
| `orangepi-zero3` | OrangePi-Zero3 |
| `h618-devboard` | H618-DevBoard |
| `x98h` | X98H |
| `vontar-h618` | Vontar-H618 |
| `painet-p3` | PaiNet-P3 |
| `bt-100m` | H618-BT-100M |
| `bt-1000m` | H618-BT-1000M |
