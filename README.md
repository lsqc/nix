![img](assets/img.png)

# nix

flake for my personal NixOS hosts and infrastructure hosted in the `proxima-centauri.nya.vodka` and `catbox.nya.vodka` clusters.

## overview 

- `common/`: common configuration for all servers
- `hosts/`
    - `hw/`: configurations for non-virtual hosts
        - `t500`: a lenovo t500 <br>![img](assets/thinkpad.jpg)
        - `masatoki`: storage server (hardware)
        - `ivy`: my r720 
    - `lxc/`: configurations for Proxmox LXC containers
        - `atm`: a container for a ATM10 minecraft server instance.
    - `vm/`: configurations for Proxmox VMS
        - `postgresql-1`: a postgres container that is not functional yet :3
        - `cookie`: a minecraft server vm. 🍪

- README.md: this piece of shit

---

`nixos-anywhere --flake .#host root@ip --generate-hardware-config nixos-generate-config ./hosts/host/hardware-configuration.nix --phases disko,install` -> shamelessly stolen from https://git.heroin.trade/xqtc/ryuko-nix 
