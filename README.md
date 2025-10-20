# nix

flake for my personal NixOS hosts and infrastructure hosted in the `proxima-centauri.nya.vodka` and `catbox.nya.vodka` clusters.

## overview 

- `common/`: 
    - `home/`: home-manager configurations
    - `{keys,users}.nix`: user and ssh key config

- `hosts/`
    - `hw/`: configurations for non-virtual hosts
        - `t500`: a lenovo t500 <br>![img](assets/thinkpad.jpg)
        - `masatoki`: storage server
        - `ivy`: my r720 (old)
    - `lxc/`: configurations for Proxmox LXC containers
        - `atm`: a container for a ATM10 minecraft server instance.
    - `vm/`: configurations for Proxmox VMS
        - `postgresql-1`: *a postgres container that is not functional yet :3*
        - `cookie`: a minecraft server vm. 🍪
        - `cerberus`: soon-to-be configuraton for `cerberus-v2.lsdevcloud.net`

---

## Remote install:

- `nixos-anywhere --flake .#<host> root@<ip> --generate-hardware-config nixos-generate-config ./hosts/<type>/<host>/hardware-configuration.nix --phases disko,install` -> shamelessly stolen from https://git.heroin.trade/xqtc/ryuko-nix 

custom ISO file: https://files.nya.vodka/pub/nix-iso/nix-iso-latest.iso

---

## Remote rebuild:

- `nixos-rebuild switch --flake .#<host> --target-host root@<ip> --build-host root@<ip>`
