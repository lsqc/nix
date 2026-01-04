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

    quickshell = {
      url = "github:quickshell-mirror/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, agenix, disko, home-manager, niri, ... }:
    let

      system = "x86_64-linux";
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

        postgres-1 = nixpkgs.lib.nixosSystem {
          inherit system;

          modules = commonModules ++ [ ./hosts/lxc/db/postgres-1 ];
        };

        cerberus = nixpkgs.lib.nixosSystem {
          inherit system;

          modules = commonModules ++ [

            ./hosts/vm/cerberus/disko-config.nix
            ./hosts/vm/cerberus
          ];
        };

        hydra = nixpkgs.lib.nixosSystem {
          inherit system;

          modules = commonModules ++ [

            ./hosts/vm/hydra/disko-config.nix
            ./hosts/vm/hydra
          ];
        };

        torrent = nixpkgs.lib.nixosSystem {
          inherit system;

          modules = commonModules ++ [

            ./hosts/vm/torrent
            ./hosts/vm/torrent/disko-config.nix
          ];
        };

        IIvy = nixpkgs.lib.nixosSystem {
          inherit system;

          modules = commonModules ++ [

            ./hosts/vm/IIvy/disko-config.nix
            ./hosts/vm/IIvy
          ];
        };

        mail = nixpkgs.lib.nixosSystem {
          inherit system;

          modules = commonModules ++ [

            ./hosts/vm/mail/disko-config.nix
            ./hosts/vm/mail
          ];
        };

        hachi = nixpkgs.lib.nixosSystem {
          inherit system;

          modules = commonModules ++ [

            ./hosts/vm/hachi
            ./hosts/vm/hachi/disko-config.nix
          ];
        };
        prometheus = nixpkgs.lib.nixosSystem {
          inherit system;

          modules = commonModules ++ [

            ./hosts/vm/prometheus
            ./hosts/vm/prometheus/disko-config.nix
          ];
        };

        ash = nixpkgs.lib.nixosSystem {
          inherit system;

          modules = commonModules ++ [

            ./hosts/vm/ash
            ./hosts/vm/ash/disko-config.nix
          ];
        };
        #
        # Configurations for non-virtualized systems
        # 
        masatoki = nixpkgs.lib.nixosSystem {
          inherit system; # system = "x86_64-linux";

          modules = commonModules
            ++ [ ./hosts/hw/masatoki ./hosts/hw/masatoki/disko-config.nix ];
        };

        ivy = nixpkgs.lib.nixosSystem {
          inherit system;

          modules = commonModules ++ [

            ./hosts/hw/ivy
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
        uwubox = nixpkgs.lib.nixosSystem {
          inherit system; # system = "x86_64-linux";

          modules = commonModules ++ [
            niri.nixosModules.niri

            ./hosts/hw/uwubox
          ];
        };

        t420 = nixpkgs.lib.nixosSystem {
          inherit system; # system = "x86_64-linux";

          modules = commonModules ++ [

            ./hosts/hw/t420
            ./hosts/hw/t420/disko-config.nix
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
        modules = [
          { _module.args.inputs = inputs; }
          ./home/lsqc
          niri.homeModules.niri
        ];
      };
    };
}
