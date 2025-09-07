{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../../common
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "ivy";  

  services.nfs.server = {
    enable = true;
    exports = ''
        /mnt/nya 10.42.100.0/22(rw,sync,no_subtree_check,no_root_squash)
    '';
  };

  system.stateVersion = "25.05"; 
}

