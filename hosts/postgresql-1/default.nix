{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ../../common
    ];

  # bootloader 
  boot.loader.grub.enable = true;
  boot.loader.grub.efiSupport = true;
  boot.loader.grub.device = "/dev/sda";

  # network shit
  networking.hostName = "postgresql-1";

  # networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  environment = {

    systemPackages = with pkgs; [
   
    ];
  };

  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 22 5432 ];
  };

  # system.copySystemConfiguration = true; -> not supported with flakes

  system.stateVersion = "25.05";

}

