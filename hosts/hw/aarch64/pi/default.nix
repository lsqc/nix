{ ... }:

{
  imports = [
    ./hardware.nix

    ../../../../common
  ];

  boot.loader.grub.enable = false;
  boot.loader.generic-extlinux-compatible.enable = true;

  networking.hostName = "pi";

  networking.networkmanager.enable = true;

  system.stateVersion = "25.11"; # Did you read the comment?

}
