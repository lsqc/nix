{ config, lib, pkgs, ... }:

{
  programs.niri = {
    enable = true;
    settings = {

      prefer-no-csd = true;

      outputs."LVDS-1".scale = 1;
      workspaces = {
        "browser" = { };
        "terminal" = { };
        "signal" = { };
        "uwu" = { };
        "telegram" = { };
        "dmca" = { };
      };

      animations = { slowdown = 0.5; };

      cursor = {
        theme = "default";
        size = 7;
      };

      spawn-at-startup = [
        {
          command = [
            "swww"
            "img"
            "~/.local/share/wallpapers/latest.png"
            # "-m"
            # "fill"
          ];
        }
        { command = [ "${lib.getExe pkgs.waybar}" ]; }
      ];
      binds = let actions = config.lib.niri.actions;
      in {
        "Mod+Return".action = actions.spawn "alacritty" "-e" "tmux";
        "Mod+Shift+Return".action = actions.spawn "alacritty";
        "Mod+D".action = actions.spawn "rofi" "-show" "drun";

        "Mod+Shift+E" = {
          allow-when-locked = false;
          action.quit.skip-confirmation = false;
        };

        "Mod+Alt+L".action = actions.spawn "hyprlock";

        "Mod+1".action = actions.focus-workspace "browser";
        "Mod+2".action = actions.focus-workspace "terminal";
        "Mod+9".action = actions.focus-workspace "telegram";
        "Mod+6".action = actions.focus-workspace "uwu";
        "Mod+F9".action = actions.focus-workspace "signal";
        "Mod+0".action = actions.focus-workspace "dmca";

        "Mod+H".action = actions.focus-column-left;
        "Mod+L".action = actions.focus-column-right;
        "Mod+J".action = actions.focus-window-or-workspace-down;
        "Mod+K".action = actions.focus-window-or-workspace-up;

        "Mod+C".action = actions.center-visible-columns;

        "Mod+Home".action = actions.focus-column-first;
        "Mod+End".action = actions.focus-column-last;

        "Mod+Shift+H".action = actions.move-column-left;
        "Mod+Shift+L".action = actions.move-column-right;
        "Mod+Shift+K".action = actions.move-column-to-workspace-up;
        "Mod+Shift+J".action = actions.move-column-to-workspace-down;
        "Mod+Shift+Space".action = actions.toggle-window-floating;

        "Mod+F".action = actions.maximize-column;
        "Mod+Shift+F".action = actions.fullscreen-window;
        "Mod+O".action = actions.toggle-overview;
        "Mod+Space".action = actions.toggle-overview;
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

      layout = {

        gaps = 10;
        border = { enable = false; };
        # center-focused-column = "always";
        default-column-width = { proportion = 0.9; };
      };
      layer-rules = [{
        matches = [{ namespace = "^wallpaper$"; }];
        # place-within-backdrop = true;
      }];

      hotkey-overlay = { skip-at-startup = true; };

      window-rules = [
        {
          matches = [{ app-id = "^firefox$"; }];
          open-on-workspace = "browser";
        }
        {
          matches = [{ title = "Alacritty"; }];
          # opacity = 0.1;

        }
      ];
    };
  };
}
