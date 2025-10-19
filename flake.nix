{
  description = "flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";

    agenix.url = "github:ryantm/agenix";
    agenix.inputs.nixpkgs.follows = "nixpkgs";

    disko.url = "github:nix-community/disko";

    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, agenix, disko, home-manager, ... }@inputs: let 

      system = "x86_64-linux";
      commonHome = ./common/home;

      commonModules = [
        agenix.nixosModules.default
      ];
  in {
    nixosConfigurations.masatoki = nixpkgs.lib.nixosSystem{
      inherit system; # system = "x86_64-linux";

      modules = commonModules ++ [
        ./hosts/hw/masatoki
      ];
    };
 
    nixosConfigurations.ivy = nixpkgs.lib.nixosSystem{
      inherit system; 

      modules = commonModules ++ [
        disko.nixosModules.disko

        ./hosts/hw/ivy
        ./hosts/hw/ivy/disko-config.nix
      ];
    };
    
    nixosConfigurations.postgresql-1 = nixpkgs.lib.nixosSystem {
      inherit system; # system = "x86_64-linux";

      modules = commonModules ++ [
        ./hosts/vm/postgresql-1
      ];
    };

    nixosConfigurations.cookie = nixpkgs.lib.nixosSystem {
      inherit system; # system = "x86_64-linux";

      modules = [
        ./hosts/vm/cookie
      ];
    };
    
    nixosConfigurations.atm = nixpkgs.lib.nixosSystem {
      inherit system; # system = "x86_64-linux";

      modules = [
        ./hosts/lxc/atm
      ];
    };

    nixosConfigurations.t500 = nixpkgs.lib.nixosSystem {
      inherit system; # system = "x86_64-linux";

      modules = [
        ./hosts/hw/t500
#        home-manager.nixosModules.home-manager
#          {
#            home-manager.useGlobalPkgs = true;
#            home-manager.useUserPackages = true;
#            home-manager.users.lsqc= ./common/home/lsqc.nix;
#          }
      ];
    };

    homeConfigurations."lsqc" = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
      modules = [ ./common/home/lsqc ];
    };
  };
}
