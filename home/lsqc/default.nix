{ config, pkgs, ... }:

{

  imports = [ ./desktop.nix ./programs.nix ./modules ];

  home.username = "lsqc";
  home.homeDirectory = "/home/lsqc";
  home.stateVersion = "25.05";

  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    htop
    neovim
    playerctl
    google-java-format

    ipcalc
    calc

    niri
    scrcpy

    fuzzel
    swaylock

    prismlauncher
    cargo
    rustfmt
    rust-analyzer
    onefetch
  ];
}
