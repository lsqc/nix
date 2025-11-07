{ config, lib, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix

    ../../../common
    ../../../common/desktop.nix
  ];
  
  networking = {
    hostName = "t540p";
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

    printing = { enable = true; };

    resolved = { enable = true; };

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
      wireguard-tools
      openvpn

      betterlockscreen
      nerd-fonts.comic-shanns-mono

      traceroute
      macchanger
      feh
      killall

      marp-cli

      sl
      lolcat
      asciiquarium
      whois

      nfs-utils
      clang
      rustc

      xfce.thunar

      libreoffice

      openjdk21
      jdt-language-server
      maven

      openscad
      netsurf.browser

      # cute discord >w<
      vesktop

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
      pulseaudio
    ];
  };

  system.stateVersion = "25.05";
}
