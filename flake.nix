{
  description = "flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    agenix.url = "github:ryantm/agenix";
    agenix.inputs.nixpkgs.follows = "nixpkgs";

    disko.url = "github:nix-community/disko";

    home-manager.url = "github:nix-community/home-manager/release-25.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, agenix, disko, home-manager, niri, ... }:
    let

      system = "x86_64-linux";
      hostPlatform = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };

      commonModules = [ agenix.nixosModules.default disko.nixosModules.disko ];

    in {
      nixosConfigurations = {

        #
        # Configurations for vms and lxcs
        # 
        cookie = nixpkgs.lib.nixosSystem {
          inherit system; # system = "x86_64-linux";

          modules = commonModules ++ [ ./hosts/vm/cookie ];
        };

        atm = nixpkgs.lib.nixosSystem {
          inherit system; # system = "x86_64-linux";

          modules = commonModules ++ [ ./hosts/lxc/atm ];
        };

        dns1 = nixpkgs.lib.nixosSystem {
          inherit system; # system = "x86_64-linux";

          modules = commonModules ++ [ ./hosts/lxc/dns/dns1 ];
        };

        dns2 = nixpkgs.lib.nixosSystem {
          inherit system; # system = "x86_64-linux";

          modules = commonModules ++ [ ./hosts/lxc/dns/dns2 ];
        };

        dns3 = nixpkgs.lib.nixosSystem {
          inherit system; # system = "x86_64-linux";

          modules = commonModules ++ [ ./hosts/lxc/dns/dns3 ];
        };

        immich = nixpkgs.lib.nixosSystem {
          inherit system; # system = "x86_64-linux";

          modules = commonModules ++ [ ./hosts/lxc/immich ];
        };

        cerberus = nixpkgs.lib.nixosSystem {
          inherit system;

          modules = commonModules ++ [

            ./hosts/vm/cerberus
          ];
        };

        hydra = nixpkgs.lib.nixosSystem {
          inherit system;

          modules = commonModules ++ [

            ./hosts/vm/hydra
          ];
        };

        torrent = nixpkgs.lib.nixosSystem {
          inherit system;

          modules = commonModules ++ [

            ./hosts/vm/torrent
          ];
        };

        IIvy = nixpkgs.lib.nixosSystem {
          inherit system;

          modules = commonModules ++ [

            ./hosts/vm/IIvy
          ];
        };

        mail = nixpkgs.lib.nixosSystem {
          inherit system;

          modules = commonModules ++ [

            ./hosts/vm/mail
          ];
        };

        #
        # Configurations for non-virtualized systems
        # 
        masatoki = nixpkgs.lib.nixosSystem {
          inherit system; # system = "x86_64-linux";

          modules = commonModules ++ [ ./hosts/hw/masatoki ];
        };

        ivy = nixpkgs.lib.nixosSystem {
          inherit system;

          modules = commonModules ++ [

            ./hosts/hw/ivy
            ./hosts/hw/ivy/disko-config.nix
          ];
        };

        gemini = nixpkgs.lib.nixosSystem {
          inherit system;

          modules = commonModules ++ [

            ./hosts/hw/gemini
          ];
        };

        testbox = nixpkgs.lib.nixosSystem {
          inherit system;

          modules = commonModules ++ [

            ./hosts/hw/testbox
          ];
        };

        cheese = nixpkgs.lib.nixosSystem {
          inherit system;

          modules = commonModules ++ [

            ./hosts/hw/cheese
          ];
        };
        w500 = nixpkgs.lib.nixosSystem {
          inherit system; # system = "x86_64-linux";

          modules = commonModules ++ [
            niri.nixosModules.niri

            ./hosts/hw/w500
          ];
        };

        # t540p = nixpkgs.lib.nixosSystem {
        #   inherit system;

        #   modules = [ ./hosts/hw/t540p ./hosts/hw/t540p/disko-config.nix ];
        # };

        antlia = nixpkgs.lib.nixosSystem {
          inherit system;

          modules = commonModules ++ [

            ./hosts/hw/antlia
          ];
        };

        #
        # Configuration for the custom live cd
        # 
        liveIso = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            (nixpkgs
              + "/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix")

            ./hosts/live/iso
          ];
        };
      };

      apps.x86_64-linux.buildIso = {
        type = "app";
        program = toString (pkgs.writeShellScript "build-iso" ''
          nix build .#nixosConfigurations.liveIso.config.system.build.isoImage
        '');
      };

      homeConfigurations."lsqc" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        modules = [ { _module.args.inputs = inputs; } ./home/lsqc ];
      };
    };
}
