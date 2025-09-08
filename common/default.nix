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

    # aliases
    shellAliases = {
      vim = "nvim";
      vi = "nvim";
      ls = "ls -lsah";
      ll = "ls -l";
      la = "ls -a";
    };

    # package configuration
    systemPackages = with pkgs; [
      neovim
  
      wget
      git
      curl
      tmux
  
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
      PermitRootLogin = "prohibit-password";
      PasswordAuthentication = false;
    };
  };
}

