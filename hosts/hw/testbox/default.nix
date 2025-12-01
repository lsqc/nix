{ config, lib, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix

    ../../../common
    ../../../common/grub-uefi.nix

    ./modules
  ];

  networking = {

    hostName = "testbox";

    # firewall = {
    #   enable = true;
    #   allowedTCPPorts = [ 22 80 443 8080 ];
    # };
  };
}
