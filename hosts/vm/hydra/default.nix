{ config, lib, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      ../../../common
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
  system.stateVersion = "25.05"; 
}

