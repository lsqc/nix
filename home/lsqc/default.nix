{ pkgs, ... }:

{

  imports = [ ./desktop.nix ./programs.nix ./modules ];

  home.username = "lsqc";
  home.homeDirectory = "/home/lsqc";
  home.stateVersion = "25.11";

  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    htop
    neovim
    playerctl
    google-java-format

    ipcalc
    calc

    # niri
    swaybg
    scrcpy

    fuzzel
    swaylock
    hyprlock

    prismlauncher
    cargo
    rustfmt
    rust-analyzer
    onefetch
    typos-lsp

    cmake
    speedtest-cli

    timer
    clock-rs

    pngquant
    xclip
    scrot
    betterlockscreen

    playerctl
    pamixer
    vlc

    wireguard-tools
    traceroute

    scrcpy
    openvpn

    whois
    killall
    dunst
    libnotify

    asciiquarium-transparent
    feh
    clang
    arandr
    yt-dlp
  ];
}
