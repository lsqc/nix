{ pkgs, lib, ... }:

{
  programs.tmux = {
    enable = true;

    shell = "${lib.getExe pkgs.zsh}";
    terminal = "tmux-256color";
    historyLimit = 1000000;
    plugins = with pkgs; [ tmuxPlugins.catppuccin ];

    extraConfig = ''
      setw -g mode-keys vi

      # set prefix
      unbind C-b
      set-option -g prefix C-s
      bind-key C-s send-prefix

      # window splitting
      bind | split-window -h
      bind - split-window -v
      unbind '"'
      unbind %

      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U
      bind l select-pane -R

      set-window-option -g xterm-keys on

    '';
  };
}
