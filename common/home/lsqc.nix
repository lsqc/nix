{ config, pkgs, ... }:

{
  home.username = "lsqc";
  home.homeDirectory = "/home/lsqc";
  home.stateVersion = "25.05";

  programs.zsh.enable = true;
  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    userEmail = "lsqc@nya.vodka";
    userName = "lsqc";
  };

  # home.packages = [
  #   pkgs.htop
  #   pkgs.neovim
  # ];
}
