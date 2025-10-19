{ config, pkgs, ... }:

{
  home.username = "lsqc";
  home.homeDirectory = "/home/lsqc";
  home.stateVersion = "25.05";

  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    userEmail = "lsqc@nya.vodka";
    userName = "lsqc";
  };

  programs.zsh = {
    enable = true;

    history.size = 20000;

   
    shellAliases = {
      la = "ls -ah";
      ll = "ls -ah";
    };
  };

  # home.packages = [
  #   pkgs.htop
  #   pkgs.neovim
  # ];
}
