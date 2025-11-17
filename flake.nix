{
  description = "flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    agenix.url = "github:ryantm/agenix";
    agenix.inputs.nixpkgs.follows = "nixpkgs";

    disko.url = "github:nix-community/disko";

    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, agenix, disko, home-manager, niri, ... }@inputs:
    let

      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };

      commonModules = [ agenix.nixosModules.default ];
    in {
      nixosConfigurations = {

        masatoki = nixpkgs.lib.nixosSystem {
          inherit system; # system = "x86_64-linux";

          modules = commonModules ++ [ ./hosts/hw/masatoki ];
        };

        ivy = nixpkgs.lib.nixosSystem {
          inherit system;

          modules = commonModules ++ [
            disko.nixosModules.disko

            ./hosts/hw/ivy
            ./hosts/hw/ivy/disko-config.nix
          ];
        };

        gemini = nixpkgs.lib.nixosSystem {
          inherit system;

          modules = commonModules ++ [
            disko.nixosModules.disko

            ./hosts/hw/gemini
            ./hosts/hw/gemini/disko-config.nix
          ];
        };

        cookie = nixpkgs.lib.nixosSystem {
          inherit system; # system = "x86_64-linux";

          modules = commonModules ++ [ ./hosts/vm/cookie ];
        };

        atm = nixpkgs.lib.nixosSystem {
          inherit system; # system = "x86_64-linux";

          modules = commonModules ++ [ ./hosts/lxc/atm ];
        };

        w500 = nixpkgs.lib.nixosSystem {
          inherit system; # system = "x86_64-linux";

          modules = [ niri.nixosModules.niri ./hosts/hw/w500 ];
        };

        t540p = nixpkgs.lib.nixosSystem {
          inherit system;

          modules = [ ./hosts/hw/t540p ./hosts/hw/t540p/disko-config.nix ];
        };

        cerberus = nixpkgs.lib.nixosSystem {
          inherit system;

          modules = commonModules ++ [
            disko.nixosModules.disko

            ./hosts/vm/cerberus
            ./hosts/vm/cerberus/disko-config.nix
          ];
        };

        hydra = nixpkgs.lib.nixosSystem {
          inherit system;

          modules = commonModules ++ [
            disko.nixosModules.disko

            ./hosts/vm/hydra
            ./hosts/vm/hydra/disko-config.nix
          ];
        };

        IIvy = nixpkgs.lib.nixosSystem {
          inherit system;

          modules = commonModules ++ [
            disko.nixosModules.disko

            ./hosts/vm/IIvy
            ./hosts/vm/IIvy/disko-config.nix
          ];
        };

        # custom live cd with ssh keys
        live = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            (nixpkgs
              + "/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix")
            ./hosts/live
          ];
        };
      };

      apps.x86_64-linux.buildIso = {
        type = "app";
        program = toString (pkgs.writeShellScript "build-iso" ''
          nix build .#nixosConfigurations.live.config.system.build.isoImage
        '');
      };

      homeConfigurations."lsqc" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        modules = [ ./common/home/lsqc ];
      };
    };
}
