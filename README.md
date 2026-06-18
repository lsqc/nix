# This repository as well as my github mirrors are deprecated. The new repositories can be found at https://git.nya.vodka/lsqc.
---
# nix

flake containing my home manager configurations and personal infrastructure hosted in the `pc.nya.vodka` and `catbox.nya.vodka` clusters

## Remote install

- `nixos-anywhere --flake .#<host> root@<ip> --generate-hardware-config nixos-generate-config ./hosts/<type>/<host>/hardware-configuration.nix --phases disko,install` -> shamelessly stolen from https://git.heroin.trade/xqtc/ryuko-nix 

---

## live ISO

- configuration: `hosts/live/iso`
- latest pre-built file: https://files.nya.vodka/pub/nix/iso/latest.iso
- build: `nix build .#nixosConfigurations.live.config.system.build.isoImage` *or* `nix run .#buildIso`

## LXC template

- configuration: `hosts/live/lxc`
- latest pre-built file: https://files.nya.vodka/pub/nix/lxc-template/latest.tar.xz
- build: `nixos-rebuild build-image --image-variant proxmox-lxc --flake .#lxcTemplate`

---

## Remote rebuild

- `nixos-rebuild switch --flake .#<host> --target-host root@<ip> --build-host root@<ip>`
