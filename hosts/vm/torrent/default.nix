{ config, lib, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../../common
    ../../../common/grub-uefi.nix

    ./modules
  ];

  networking = {
    hostName = "torrent";

    firewall = {
      enable = true;
      allowedTCPPorts = [ 22 80 443 8112 ];
    };
  };

  time.timeZone = "Europe/Berlin";

}

