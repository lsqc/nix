{
  description = "flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
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
      hostPlatform = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };

      commonModules = [ agenix.nixosModules.default ];
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

        dns-1 = nixpkgs.lib.nixosSystem {
          inherit system; # system = "x86_64-linux";

          modules = commonModules ++ [ ./hosts/lxc/dns/dns-1 ];
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

        torrent = nixpkgs.lib.nixosSystem {
          inherit system;

          modules = commonModules ++ [
            disko.nixosModules.disko

            ./hosts/vm/torrent
            ./hosts/vm/torrent/disko-config.nix
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

        mail = nixpkgs.lib.nixosSystem {
          inherit system;

          modules = commonModules ++ [
            disko.nixosModules.disko

            ./hosts/vm/mail
            ./hosts/vm/mail/disko-config.nix
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

        testbox = nixpkgs.lib.nixosSystem {
          inherit system;

          modules = commonModules ++ [
            disko.nixosModules.disko

            ./hosts/hw/testbox
            ./hosts/hw/testbox/disko-config.nix
          ];
        };

        w500 = nixpkgs.lib.nixosSystem {
          inherit system; # system = "x86_64-linux";

          modules = [
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

          modules = [
            disko.nixosModules.disko

            ./hosts/hw/antlia
            ./hosts/hw/antlia/modules/disko.nix
          ];
        };

        #
        # Configuration for the custom live cd
        # 
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
        modules = [ ./home/lsqc ];
      };
    };
}
