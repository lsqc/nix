{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../../common
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking = {
    hostName = "ivy";
    nameservers = [ "10.42.101.1" "10.42.0.2" ];

    firewall = {
      enable = true;
      allowedTCPPorts = [ 22 443 6969 80 2049 ]; 
    };
  };

  environment.systemPackages = with pkgs; [
    stress-ng
  ];

  services.nfs.server = {
    enable = true;
    exports = ''
        /mnt/nya 10.42.100.0/22(rw,sync,no_subtree_check,no_root_squash)
    '';
  };

  services.nginx = {
    enable = true;
    
    virtualHosts."_" = {
      root = "/mnt/nya/public";
      extraConfig = ''
        autoindex on;
        autoindex_exact_size off;
      '';
    };
  };

  system.stateVersion = "25.05"; 
}

