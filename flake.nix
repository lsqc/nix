{
  description = "flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";

    agenix.url = "github:ryantm/agenix";
    agenix.inputs.nixpkgs.follows = "nixpkgs";

  };

  outputs = { self, nixpkgs, agenix, ... }@inputs: let 

      system = "x86_64-linux";

      commonModules = [
        agenix.nixosModules.default
      ];
  in {
    nixosConfigurations.masatoki = nixpkgs.lib.nixosSystem{
      system = "x86_64-linux";

      modules = commonModules ++ [
        ./hosts/masatoki
      ];
    };
    
    nixosConfigurations.postgresql-1 = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";

      modules = commonModules ++ [
        ./hosts/vm/postgresql-1
      ];
    };

    nixosConfigurations.cookie = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";

      modules = [
        ./hosts/vm/cookie
      ];
    };
    
    nixosConfigurations.atm = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./hosts/lxc/atm
      ];
    };
  };
}
