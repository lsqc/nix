{ config, lib, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      ../../../common
    ];

  boot.loader.grub = {
    enable = true;
    device = "/dev/sda";
  };

  networking = {
    hostName = "t500";
    networkmanager.enable = true;
#    resolvconf.enable = true;
  };

  # bluetooth
  hardware.bluetooth.enable = true;

  # time shit
  time.timeZone = "Europe/Berlin";

  services = {
 
    blueman.enable = true;

    logind = {
      lidSwitch = "ignore";
      lidSwitchExternalPower = "ignore";
    };
  
    printing = {
      enable = true;
    };
  
    resolved = {
  
      enable = true;
      domains = [ "~." ];
      fallbackDns = [ "1.1.1.1#one.one.one.one" "1.0.0.1#one.one.one.one" ];
    };

    xserver = {
    
      enable = true;
  
      xkb.layout = "eu";
      displayManager.startx.enable = true;
  
      videoDrivers = [ "modesetting" ];

      windowManager.i3 = {
        enable = true;
        extraPackages = with pkgs; [
          i3status
          i3blocks
          networkmanagerapplet
          rofi
        ];
      };
    };
  
    pipewire = {
      enable = true;
      pulse.enable = true;
    };
  };
  
  programs = {
    nix-ld.enable = true;
  
    ssh.extraConfig = ''
      Host git.proxima-centauri.lsdevcloud.net
          PreferredAuthentications publickey
	  IdentityFile ~/.ssh/gitkey
    '';

    hyprland = {
      enable = true;
      withUWSM = true;
      xwayland.enable = true;
    };
  };
  
  users.users.lsqc = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      alacritty
      librewolf
      tor-browser

      wireguard-tools
      openvpn

      betterlockscreen
      nerd-fonts.comic-shanns-mono

      traceroute
      macchanger
      dig
      feh
      killall

      marp-cli
 
      sl
      lolcat
      asciiquarium
      whois

      keepassxc
      nfs-utils
      clang
      rustc

      yazi
      xfce.thunar
      adapta-gtk-theme
      paper-icon-theme

      inkscape
      gimp
      libreoffice

      openjdk21
      jdt-language-server
      maven

      openscad
      netsurf.browser
      prusa-slicer

      # cute discord >w<
      vesktop
      thunderbird
      signal-desktop
      telegram-desktop

      pavucontrol

      angryipscanner
      arandr

      prismlauncher
     
      # screenshot stuff
      xclip
      pngquant

      # notifications
      libnotify
      dunst
  #    tree
    ];
  };

  environment = {
    systemPackages = with pkgs; [
      wget
      hyfetch
      scrot
      wireshark
      tcpdump
      nix-ld
      # pkgs.xorg.xinit
    ];
  
    shellAliases = {
      #neofetch = "hyfetch";
    };

    variables = {
      EDITOR = "nvim";
      BROWSER = "librewolf";
      TERMINAL= "alacritty";
    };
  };

  fonts.packages = with pkgs; [ 
    dejavu_fonts

    nerd-fonts.fantasque-sans-mono
    nerd-fonts.comic-shanns-mono
  ];

  system.stateVersion = "25.05"; # Did you read the comment?

}

