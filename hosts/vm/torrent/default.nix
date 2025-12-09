{ config, lib, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../../common
    ../../../common/vm.nix
    ../../../common/grub-uefi.nix

    ./modules
  ];

  networking = { hostName = "torrent"; };

  time.timeZone = "Europe/Berlin";

}

