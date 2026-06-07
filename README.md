# nix

flake containing my home manager configurations and personal infrastructure hosted in the `pc.nya.vodka` and `catbox.nya.vodka` clusters

## Remote install

- `nixos-anywhere --flake .#<host> root@<ip> --generate-hardware-config nixos-generate-config ./hosts/<type>/<host>/hardware-configuration.nix --phases disko,install` -> shamelessly stolen from https://git.heroin.trade/xqtc/ryuko-nix 

---

## Custom ISO

- latest pre-built file: https://files.nya.vodka/pub/nix/iso/latest.iso
- build: `nix build .#nixosConfigurations.live.config.system.build.isoImage` *or* `nix run .#buildIso`

**TODO: create lxc template**

---

## Remote rebuild

- `nixos-rebuild switch --flake .#<host> --target-host root@<ip> --build-host root@<ip>`
