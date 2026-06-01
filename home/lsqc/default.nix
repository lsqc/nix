{ inputs, pkgs, ... }:

{
  imports = [
    ./desktop.nix
    ./modules
    ./host.nix
  ];

  home.username = "lsqc";
  home.homeDirectory = "/home/lsqc";
  home.stateVersion = "25.11";

  programs.home-manager.enable = true;

  nixpkgs.config.allowUnfree = true;

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

    scrcpy
    openvpn

    whois
    wlr-randr
    killall
    # dunst
    libnotify

    asciiquarium-transparent
    feh
    clang
    arandr
    yt-dlp
    usbutils

    just
    fzf
    libreoffice-qt-fresh
    pandoc
    texliveSmall
    opentofu
    wl-mirror
    brightnessctl

    steam
    mtr
    pv
    jameica

    xwayland-satellite
    inputs.helium.packages.x86_64-linux.default

    tldr
    yubioath-flutter
    wl-clipboard
  ];
}
