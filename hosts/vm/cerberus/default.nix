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
    hostName = "cerberus";

    firewall = {
      enable = true;
      allowedTCPPorts = [ 22 80 443 ];
    };
  };

  time.timeZone = "Europe/Berlin";

  # system.stateVersion = "25.05"; 
}

