{ pkgs, lib, ... }:

{
  programs.tmux = {
    enable = true;

    shell = "${lib.getExe pkgs.zsh}";
    terminal = "tmux-256color";
    historyLimit = 1000000;
    plugins = with pkgs; [ ];

    extraConfig = ''
      setw -g mode-keys vi

      # set prefix
      unbind C-b
      set-option -g prefix C-s
      bind-key C-s send-prefix

      # window splitting
      unbind '"'
      unbind %

      bind | split-window -h -c "#{pane_current_path}"
      bind - split-window -v -c "#{pane_current_path}"

      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U
      bind l select-pane -R

      set-window-option -g xterm-keys on

      # theme
      set -g pane-active-border-style 'fg=#E91E63'
      set -g pane-border-style 'fg=#2C2C2C'

      # status line
      set -g status-style 'bg=#000000,fg=#3dd9a4'
      set -g status-left-style 'bg=#000000,fg=#3dd9a4'
      set -g status-right-style 'bg=#000000,fg=#3dd9a4'
      set -g window-status-style 'bg=#000000,fg=#3dd9a4'
      set -g window-status-current-style 'bg=#000000,fg=#3dd9a4'
    '';
  };
}
