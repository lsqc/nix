{
  description = "flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";

    agenix.url = "github:ryantm/agenix";
    agenix.inputs.nixpkgs.follows = "nixpkgs";

    disko.url = "github:nix-community/disko";
  };

  outputs = { self, nixpkgs, agenix, disko, ... }@inputs: let 

      system = "x86_64-linux";

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
      ];
    };
  };
}
