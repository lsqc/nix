{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;

    shell = "${pkgs.zsh}/bin/zsh";
    terminal = "tmux-256color";
    historyLimit = 1000000;
    plugins = with pkgs; [ tmuxPlugins.catppuccin ];

    #    extraConfig = '''';
  };
}
