{ config, lib, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../../common
    ../../../common/grub-uefi.nix

    ./modules
  ];

  networking = { hostName = "torrent"; };

  time.timeZone = "Europe/Berlin";

}

