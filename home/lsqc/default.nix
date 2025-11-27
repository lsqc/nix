{ config, pkgs, ... }:

{

  imports = [ ./desktop.nix ./programs.nix ./modules ];

  home.username = "lsqc";
  home.homeDirectory = "/home/lsqc";
  home.stateVersion = "25.05";

  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    userEmail = "lsqc@nya.vodka";
    userName = "lsqc";
  };

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
  ];
}
