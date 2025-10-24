{ config, pkgs, ... }:

{

  imports = [ ./desktop.nix ./programs.nix ];

  home.username = "lsqc";
  home.homeDirectory = "/home/lsqc";
  home.stateVersion = "25.05";

  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    userEmail = "lsqc@nya.vodka";
    userName = "lsqc";
  };

  home.packages =
    [ pkgs.htop pkgs.neovim pkgs.playerctl pkgs.google-java-format ];
}
