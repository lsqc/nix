{ config, ... }:

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
      binds = let actions = config.lib.niri.actions;
      in {
        "Mod+Return".action = actions.spawn "alacritty";
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
      };
    };
  };
}
