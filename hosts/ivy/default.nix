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
      allowedTCPPorts = [ 22 443 6969 80 2049 25565 ]; 
    };
  };

  environment.systemPackages = with pkgs; [
    stress-ng
    ipmitool
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
      
      forceSSL = true; # security is nice i guess
      sslCertificate = "/etc/ssl/nginx-cert.pem";
      sslCertificateKey = "/etc/ssl/private/nginx-key.pem";

      extraConfig = ''
        autoindex on;
        autoindex_exact_size off;
      '';
    };
  };

  services.minecraft-server = {
    enable = true;
    eula = true; 
    openFirewall = true;
    declarative = true;
    dataDir = "/mnt/nya/minecraft";

    package = pkgs.papermc;

    serverProperties = {
      max-players = 50;
    };

    jvmOpts = "-Xms8G -Xmx8G";
  };

  system.stateVersion = "25.05"; 
}

