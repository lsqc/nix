{
  description = "flake";

  inputs = { 
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
  
    agenix.url = "github:ryantm/agenix";
    agenix.inputs.nixpkgs.follows = "nixpkgs";
    
    disko.url = "github:nix-community/disko";
    
    home-manager.url = "github:nix-community/home-manager/release-25.05"; 
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    
    colmena.url = "github:zhaofengli/colmena";
  };

  outputs = { self, nixpkgs, colmena, agenix, disko, home-manager, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
      commonModules = [ agenix.nixosModules.default ];
    in
    {
    
      colmena = {
        meta = {
          nixpkgs = import nixpkgs {
            system = "x86_64-linux";
          };
        };
      
        masatoki = { name, nodes, ... }: {
          imports = commonModules ++ [ ./hosts/hw/masatoki ];
        };
      
        ivy = { name, nodes, ... }: {
          imports = commonModules ++ [
            disko.nixosModules.disko
            ./hosts/hw/ivy
            ./hosts/hw/ivy/disko-config.nix
          ];
        };
      
        cookie = { name, nodes, ... }: {
          imports = commonModules ++ [ ./hosts/vm/cookie ];
        };
      
        atm = { name, nodes, ... }: {
          imports = commonModules ++ [ ./hosts/lxc/atm ];
        };
      
        t500 = { name, nodes, ... }: {
          imports = [ ./hosts/hw/t500 ];
        };
      
        cerberus = { name, nodes, ... }: {
          imports = commonModules ++ [
            disko.nixosModules.disko
            ./hosts/vm/cerberus
            ./hosts/vm/cerberus/disko-config.nix
          ];
        };
      
        IIvy = { name, nodes, ... }: {
          imports = commonModules ++ [
            disko.nixosModules.disko
            ./hosts/vm/IIvy
            ./hosts/vm/IIvy/disko-config.nix
          ];
        };
      
        live = { name, nodes, ... }: {
          imports = [
            (nixpkgs + "/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix")
            ./hosts/live
          ];
        };
      };


      colmenaHive = colmena.lib.makeHive self.outputs.colmena;

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

