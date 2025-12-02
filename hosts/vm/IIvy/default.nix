{ config, lib, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      ../../../common

      ../../../common/grub-uefi.nix
    ];

  networking = {
    hostName = "IIvy";

    firewall = {
      enable = true;
      allowedTCPPorts = [ 22 80 443 ];
    };
  };

  system.stateVersion = lib.mkForce 25.05"; 
}

