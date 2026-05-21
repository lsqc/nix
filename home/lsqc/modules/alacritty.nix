{ config, pkgs, ... }:

{
  programs.alacritty = {
    enable = true;
    package = pkgs.alacritty;
    theme = "hyper";
    themePackage = pkgs.alacritty-theme;

    settings = {
      keyboard.bindings = [{
        key = "K";
        mods = "Control";
        chars = "\\u000c";
      }];

      font = {
        size = config.theme.font.size;
        normal = {
          family = "${config.theme.font.family}";
          # family = "Iosevka Nerd Font";
          # family = "0xProto Nerd Font";
        };
      };

      colors = {
        cursor = {
          text = "#84c1db";
          cursor = "#84c1db";
        };
      };

      cursor = {
        blink_interval = 500;
        blink_timeout = 0;
        style = {
          blinking = "Always";
          shape = "block";
        };
      };
    };
  };
}
