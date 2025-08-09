{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ../../common
    ];

  # enable flakes and new cli
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # bootloader 
  boot.loader.grub.enable = true;
  boot.loader.grub.efiSupport = true;
  boot.loader.grub.device = "/dev/sda";

  boot.kernelModules = [ "zfs" ];
  
  boot.zfs.extraPools = [ "lsd4" ];

  # network shit
  networking.hostName = "masatoki";
  networking.hostId = "9a1a84f2";

  # networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # time zone
  time.timeZone = "Europe/Berlin";

  i18n.defaultLocale = "en_US.UTF-8";

  users.users.lsqc = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];

    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMe1eur6B43u8IZWoSeW0dEqC1+3vX8lMkmRxm5yFCuG lsqc@lsdevcloud.net"
    ];

    packages = with pkgs; [
      tree
    ];
  };

  environment = {
    
    # set vim as default editor because who the fuck uses nano
    variables = {
      EDITOR = "nvim";
    };

    # package configuration
    systemPackages = with pkgs; [
      neovim
  
      wget
      git
      curl
  
      btop
      neofetch
    ];
  };

  services.openssh = {
    enable = true;
    settings = {
      X11Forwarding = true;
      PermitRootLogin = "no";
      PasswordAuthentication = false;
    };
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

