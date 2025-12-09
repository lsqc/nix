{ config, lib, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../../common
    ../../../common/vm.nix
    ../../../common/grub-uefi.nix

    ./modules
  ];

  networking = {
    hostName = "hydra";

    firewall = {
      enable = true;
      allowedTCPPorts = [ 3000 22 80 443 ];
    };
  };
  system.stateVersion = lib.mkForce "25.05";
}

