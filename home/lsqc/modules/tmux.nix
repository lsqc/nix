{ pkgs, lib, ... }:

{
  programs.tmux = {
    enable = true;

    shell = "${lib.getExe pkgs.zsh}";
    terminal = "tmux-256color";
    historyLimit = 1000000;
    plugins = with pkgs; [ tmuxPlugins.catppuccin ];

    #    extraConfig = '''';
  };
}
