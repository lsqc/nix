{ config, lib, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      ../../../common

      ./users.nix
    ];

  boot.loader.grub.enable = true;
  boot.loader.grub.efiSupport = true;
  boot.loader.grub.device = "/dev/sda";

  networking.hostName = "cookie"; 

  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 80 10690 6969 22 ];
  };

  time.timeZone = "Europe/Berlin";

  environment.systemPackages = with pkgs; [
    neovim 
    wget
    curl
    git 
    jdk21_headless
    screen
  ];

  system.stateVersion = "25.05"; 
}

