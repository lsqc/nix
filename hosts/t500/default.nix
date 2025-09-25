{ config, lib, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      ../../common
    ];

  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda"; # or "nodev" for efi only

  networking = {
    hostName = "t500";
    networkmanager.enable = true;
    resolvconf.enable = true;
  };

  time.timeZone = "Europe/Berlin";

  services.logind = {
    lidSwitch = "ignore";
    lidSwitchExternalPower = "ignore";
  };

  services.xserver = {
  
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

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };
  
  programs = {
  
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
  #programs.git = {
    #enable = true;
    #config = {
      #user.name = "lsqc";
      #user.email = "lsqc@nya.vodka";
#
      #gpg.format = "ssh";
#
      #user.signingKey = "/home/lsqc/.ssh/gitkey";
      #commit.gpgsign = true;
    #};
  #};
  #
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

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  environment = {
    systemPackages = with pkgs; [
      wget
      hyfetch
      scrot
      # pkgs.xorg.xinit
    ];
  
    shellAliases = {
      neofetch = "hyfetch";
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

  system.stateVersion = "25.11"; # Did you read the comment?

}

