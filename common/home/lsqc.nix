{ config, pkgs, ... }:

{
  home.username = "lsqc";
  home.homeDirectory = "/home/lsqc";
  home.stateVersion = "25.05";

  programs.zsh.enable = true;
  programs.git.enable = true;
  programs.home-manager.enable = true;

  # home.packages = [
  #   pkgs.htop
  #   pkgs.neovim
  # ];
}
