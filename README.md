![img](assets/img.png)

# nix

flake for my private NixOS infrastructure hosted in the `proxima-centauri.nya.vodka` and `catbox.nya.vodka` clusters.

## overview 

- `common/`: common configuration for all servers
- `hosts/`
    - `lxc/`:
        - `atm`: a container for a ATM10 minecraft server instance.
    - `vm/`:
        - `postgresql-1`: a postgres container that is not functional yet :3
        - `cookie`: a minecraft server vm. 🍪
    - `masatoki`: storage server (hardware)
    - `ivy`: my r720 

- README.md: this piece of shit
