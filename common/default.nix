{ lib, pkgs, ... }:

{

  imports = 
    [
      ./users.nix
    ];

  # enable flakes and new cli
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  networking = {
    nameservers = [
      "10.42.0.2"
      "10.42.0.3"
      "10.42.0.4"
      # "10.42.101.1" # brokey brokey
      "10.1.0.1"
      "10.1.0.2"
    ];
  };

  # timezone
  time.timeZone = "Europe/Berlin";

  # language 
  i18n.defaultLocale = "en_US.UTF-8";

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
    
      dig
    ];
  };

  # ssh server 
  services.openssh = {
    enable = true;
    settings = {
      X11Forwarding = true;
      PermitRootLogin = "no";
      PasswordAuthentication = false;
    };
  };

 # users.users.root = {
 #   openssh.authorizedKeys.keys = [
 #     "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMe1eur6B43u8IZWoSeW0dEqC1+3vX8lMkmRxm5yFCuG lsqc@lsdevcloud.net"
 #     "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFibZMulO+0XmRoFi4r8rhYix3EHcmxzI9VZQaQmsOZf uwu@lsqc.de"
 #   ];
 # };

}
