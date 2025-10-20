{ config, lib, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      ../../../common
      
      ./modules
    ];

  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot/efi";
    };
    grub = {
       efiSupport = true;
       device = "nodev";
    };
  };

  networking = {
    hostName = "cerberus";

    firewall = {
      enable = true;
      allowedTCPPorts = [ 22 80 443 ];
    };
  };

  time.timeZone = "Europe/Berlin";

  system.stateVersion = "25.05"; 
}

