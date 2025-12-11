# nix

flake for my personal NixOS hosts and infrastructure hosted in the `pc.nya.vodka` and `catbox.nya.vodka` clusters.

## overview 

- `./common/`: 
    - `{keys,users}.nix`: user and ssh key config

- `./home/`: home-manager configurations
- `./dns/`: directory for dns zone files
- `./hosts/`
    - `live/`: configuration for the custom iso image
    - `hw/`: configurations for non-virtual hosts
        - `w500`: a lenovo w500 <br>![img](assets/thinkpad.jpg)
        - `antlia`: my desktop
        - `masatoki`: storage server
        - `gemini`: an old Acer Predator G3-710 used to play around with AI
        - ~`ivy`: my r720 (old)~
        - `testbox`: a random thingy used for testing
    - `lxc/`: configurations for Proxmox LXC containers
        - `atm`: a container for a ATM10 minecraft server instance.
        - `dns/`: parent directory for all dns servers
            - `dns-1`: primary dns server
            - `dns-{2-3}`: secondary dns server
    - `vm/`: configurations for Proxmox VMS
        - `cookie`: a minecraft server vm. 🍪
        - `cerberus`: (soon-to-be) configuration for `cerberus-v2.lsdevcloud.net`
        - `IIvy`: replacement for original ivy host
        - `hydra`: a vm running my [Hydra](https://github.com/NixOS/hydra) instance.
        - `torrent`: rtorrent server w/ flood frontend [fucking broken]

---

## Remote install:

- `nixos-anywhere --flake .#<host> root@<ip> --generate-hardware-config nixos-generate-config ./hosts/<type>/<host>/hardware-configuration.nix --phases disko,install` -> shamelessly stolen from https://git.heroin.trade/xqtc/ryuko-nix 

---

## Custom ISO

- latest file: https://files.nya.vodka/pub/nix/iso/latest.iso
- build: `nix build .#nixosConfigurations.live.config.system.build.isoImage` *or* `nix run .#buildIso`

**TODO: create lxc template**

---

## Remote rebuild:

- `nixos-rebuild switch --flake .#<host> --target-host root@<ip> --build-host root@<ip>`
