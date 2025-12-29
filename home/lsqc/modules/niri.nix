{ config, lib, pkgs, ... }:

{
  programs.niri = {
    enable = true;
    settings = {
      outputs."LVDS-1".scale = 1.0;
      workspaces = {
        "browser" = { };
        "terminal" = { };
        "signal" = { };
        "telegram" = { };
        "dmca-violation" = { };
      };

      spawn-at-startup = [

        {
          command = [
            "${lib.getExe pkgs.swaybg}"
            "-i"
            "~/.local/share/wallpapers/latest.png"
            "-m"
            "fill"
          ];
        }
      ];
      binds = let actions = config.lib.niri.actions;
      in {
        "Mod+Return".action = actions.spawn "alacritty" "-e" "tmux";
        "Mod+Shift+Return".action = actions.spawn "alacritty";
        "Mod+D".action = actions.spawn "rofi" "-show" "drun";

        "Mod+Shift+E".action.quit.skip-confirmation = false;
        "Mod+Shift+L".action = actions.spawn "hyprlock";

        "Mod+1".action = actions.focus-workspace "browser";
        "Mod+2".action = actions.focus-workspace "terminal";
        "Mod+F19".action = actions.focus-workspace "signal";

        "Mod+H".action = actions.focus-column-left;
        "Mod+L".action = actions.focus-column-right;
        "Mod+J".action = actions.focus-window-or-workspace-down;
        "Mod+K".action = actions.focus-window-or-workspace-up;

        "Mod+F".action = actions.fullscreen-window;
        "Mod+O".action = actions.toggle-overview;
        "Mod+Shift+Q".action = actions.close-window;

        "Print".action.screenshot = [ ];

        XF86AudioRaiseVolume = {
          action.spawn = [ "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.1+" ];
          allow-when-locked = true;
        };
        XF86AudioLowerVolume = {
          action.spawn = [ "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.1-" ];
          allow-when-locked = true;
        };
        XF86AudioMute = {
          action.spawn = [ "wpctl" "set-mute" "@DEFAULT_AUDIO_SINK@" "toggle" ];
          allow-when-locked = true;
        };
        XF86AudioMicMute = {
          action.spawn =
            [ "wpctl" "set-mute" "@DEFAULT_AUDIO_SOURCE@" "toggle" ];
          allow-when-locked = true;
        };

        XF86AudioPlay = { action.spawn = [ "playerctl" "play-pause" ]; };
        XF86AudioPause = { action.spawn = [ "playerctl" "play-pause" ]; };
        XF86AudioNext = { action.spawn = [ "playerctl" "next" ]; };
        XF86AudioPrev = { action.spawn = [ "playerctl" "previous" ]; };
      };
    };
  };
}
