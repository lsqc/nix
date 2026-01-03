{ ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../../common
    ../../../common/vm.nix
    ../../../common/grub-uefi.nix
    ../../../common/prometheus-exporter.nix

    ./modules
  ];

  networking = { hostName = "torrent"; };

  time.timeZone = "Europe/Berlin";

}

