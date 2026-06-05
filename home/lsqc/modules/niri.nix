{
  config,
  lib,
  pkgs,
  ...
}:

let
  main = {
    center = "Samsung Electric Company LC34G55T HNTX202231";
    right = "Dell Inc. DELL P2415Q D8VXF03509FB";
    left = "Dell Inc. DELL P2415Q D8VXF99J0DVB";
  };
in
{
  programs.niri = {
    enable = true;
    settings = {

      prefer-no-csd = true;

      input = {
        focus-follows-mouse.enable = true;
        touchpad.enable = false;
      };
      outputs = {
        "${main.center}" = {
          mode = {
            height = 1440;
            width = 3440;
            refresh = 164.998993;
          };
          scale = 1;
          focus-at-startup = true;
          position = {
            x = 0;
            y = 0;
          };
        };

        # left
        "${main.left}" = {
          mode = {
            height = 1440;
            width = 2560;
            refresh = 59.951;
          };
          scale = 1;
          position = {
            x = -2560;
            y = 0;
          };
        };
        # right
        "${main.right}" = {
          mode = {
            height = 1440;
            width = 2560;
            refresh = 59.951;
          };
          scale = 1;
          position = {
            x = 3440;
            y = 0;
          };
        };

        "LVDS-1".scale = 1; # twinkpad
      };
      workspaces = {
        "1" = {
          open-on-output = "${main.center}";
        };
        "2" = {
          open-on-output = "${main.center}";
        };
        "F" = {
          open-on-output = "${main.right}";
        };
        "6" = {
          open-on-output = "${main.center}";
        };
        "8" = { };
        "9" = {
          open-on-output = "${main.right}";
        };
        "0" = {
          open-on-output = "${main.right}";
        };
        "!" = {
          open-on-output = "${main.center}";
        };
      };

      animations = {
        slowdown = 0.4;
      };

      cursor = {
        theme = "default";
        size = 7;
      };

      environment = {
        DISPLAY = ":0";
        GDK_BACKEND = "wayland,x11";
        MOZ_ENABLE_WAYLAND = "1";
      };

      spawn-at-startup = [
        { command = [ "gnome-keyring-daemon" ]; }
        {
          command = [
            "${lib.getExe pkgs.swaybg}"
            "-i"
            "${config.home.homeDirectory}/.local/share/wallpapers/latest.png"
            "-m"
            "fill"
          ];
        }
        { command = [ "${lib.getExe pkgs.waybar}" ]; }
        {
          command = [
            "${if config.host == "antlia" then "/usr/bin/" else ""}xwayland-satellite"
          ];
        }
      ];

      binds =
        let
          actions = config.lib.niri.actions;
          terminalCommand =
            if config.host == "antlia" then
              [
                "/usr/bin/alacritty"
                "-e"
                "tmux"
              ]
            else
              [
                "alacritty"
                "-e"
                "tmux"
              ];
          lockCommand = if config.host == "antlia" then "/usr/bin/hyprlock" else "hyprlock";
        in
        {
          "Mod+Return".action = actions.spawn terminalCommand;
          "Mod+Shift+Return".action = actions.spawn "alacritty";
          "Mod+D".action = actions.spawn "fuzzel";

          "Mod+Shift+E" = {
            allow-when-locked = false;
            action.quit.skip-confirmation = false;
          };

          "Mod+Alt+L".action = actions.spawn [ lockCommand ];

          "Mod+1".action = actions.focus-workspace "1";
          "Mod+2".action = actions.focus-workspace "2";
          "Mod+9".action = actions.focus-workspace "9";
          "Mod+6".action = actions.focus-workspace "6";
          "Mod+8".action = actions.focus-workspace "8";
          "Mod+F9".action = actions.focus-workspace "F";
          "Mod+0".action = actions.focus-workspace "0";
          "Mod+F1".action = actions.focus-workspace "!";

          "Mod+H".action = actions.focus-column-or-monitor-left;
          "Mod+L".action = actions.focus-column-or-monitor-right;
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

          "Alt+Tab".action = actions.focus-workspace-previous;

          # XF86
          XF86AudioRaiseVolume = {
            action.spawn = [
              "wpctl"
              "set-volume"
              "@DEFAULT_AUDIO_SINK@"
              "0.1+"
            ];
            allow-when-locked = true;
          };
          XF86AudioLowerVolume = {
            action.spawn = [
              "wpctl"
              "set-volume"
              "@DEFAULT_AUDIO_SINK@"
              "0.1-"
            ];
            allow-when-locked = true;
          };
          XF86AudioMute = {
            action.spawn = [
              "wpctl"
              "set-mute"
              "@DEFAULT_AUDIO_SINK@"
              "toggle"
            ];
            allow-when-locked = true;
          };
          XF86AudioMicMute = {
            action.spawn = [
              "wpctl"
              "set-mute"
              "@DEFAULT_AUDIO_SOURCE@"
              "toggle"
            ];
            allow-when-locked = true;
          };

          XF86AudioPlay = {
            action.spawn = [
              "playerctl"
              "play-pause"
            ];
          };
          XF86AudioPause = {
            action.spawn = [
              "playerctl"
              "play-pause"
            ];
          };
          XF86AudioNext = {
            action.spawn = [
              "playerctl"
              "next"
            ];
          };
          XF86AudioPrev = {
            action.spawn = [
              "playerctl"
              "previous"
            ];
          };

          XF86MonBrightnessUp = {
            action.spawn = [
              "brightnessctl"
              "set"
              "+10%"
            ];
          };
          XF86MonBrightnessDown = {
            action.spawn = [
              "brightnessctl"
              "set"
              "10%-"
            ];
          };
        };

      layout = {

        gaps = 10;
        border = {
          enable = true;
          width = 3;
          active.gradient = {
            angle = 45;
            from = "oklch(0.72 0.18 160)";
            to = "oklch(0.78 0.14 195)";
            in' = "oklab";
          };
          inactive.gradient = {
            angle = 45;
            from = "oklch(0.45 0.01 240)";
            to = "oklch(0.55 0.015 220)";
            in' = "oklab";
          };
        };
        default-column-width = {
          proportion = 0.9;
        };

        focus-ring.enable = false;

        background-color = "transparent";
      };
      layer-rules = [
        {
          matches = [ { namespace = "^wallpaper$"; } ];
          place-within-backdrop = true;
        }
      ];

      hotkey-overlay = {
        skip-at-startup = true;
      };

      window-rules = [
        {
          matches = [ { app-id = "^firefox$"; } ];
          open-on-workspace = "browser";
        }
        {
          matches = [ { app-id = "Alacritty"; } ];
          opacity = 0.84;
        }
        {
          matches = [
            {
              app-id = "^firefox$";
              title = "^Picture-in-Picture$";
            }
          ];
        }
      ];
    };
  };
}
