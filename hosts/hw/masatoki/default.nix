{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ../../../common
    ];

  # bootloader 
  boot.loader.grub.enable = true;
  boot.loader.grub.efiSupport = true;
  boot.loader.grub.device = "/dev/sda";

  boot.kernelModules = [ "zfs" ];
  
  boot.zfs.extraPools = [ "lsd4" ];

  # network shit
  networking.hostName = "masatoki";
  networking.hostId = "9a1a84f2";

  environment = {
    
    systemPackages = with pkgs; [
    
    ];
  };

  # nfs shit
  services.nfs.server = {
    enable = true;
    exports = ''

    '';
  };

  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 22 2049 80 443 ];
  };

  # system.copySystemConfiguration = true; -> not supported with flakes

  system.stateVersion = "25.05";

}
