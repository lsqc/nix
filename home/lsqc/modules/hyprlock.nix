{ ... }:

{
  programs.hyprlock = {
    enable = true;

    # extraConfig = ''
    #   label {
    #       monitor =
    #       text = cmd[update:1000] echo "<span>$(date +"%I:%M")</span>"
    #       color = rgba(216, 222, 233, .75)
    #       font_size = 40
    #       font_family = SF Pro Display Bold
    #       position = 0, 120
    #       halign = center
    #       valign = center
    #   }

    # '';

    settings = {
      general = {
        hide_cursor = true;
        ignore_empty_input = true;
      };
      background = [{
        path = "screenshot";
        blur_passes = 3;
        blur_size = 4;
      }];

      label = [
        # clock
        {
          # size = "200, 50";
          font_size = 40;
          font_family = "SF Pro Display Bold";
          position = "0, 220";
          monitor = "";
          text = "<span>$TIME</span>";
          font_color = "rgba(216, 222, 233, .75)";
          #       color = rgba(216, 222, 233, .75)
          # inner_color = "rgb(91, 96, 120)";
          # outer_color = "rgb(24, 25, 38)";
          shadow_passes = 2;
        }
        # user name
        {
          size = "200, 50";
          position = "0, 20";
          monitor = "";
          text = "<span>$USER</span>";
          font_color = "rgb(202, 211, 245)";
          inner_color = "rgb(91, 96, 120)";
          outer_color = "rgb(24, 25, 38)";
          shadow_passes = 2;
        }
      ];

      image = [{
        monitor = "";
        size = 100;
        path = "~/repos/nix/assets/hyprlock-img.jpg";
        position = "0, 100";

      }];
      input-field = [{
        size = "200, 50";
        position = "0, -60";
        monitor = "";
        dots_size = 0.2;
        dots_center = true;
        fade_on_empty = false;
        # font_color = "rgb(202, 211, 245)";
        # inner_color = "rgb(91, 96, 120)";
        # outer_color = "rgb(24, 25, 38)";
        outline_thickness = 3;
        placeholder_text = "<span>Password...</span>";
        shadow_passes = 2;
      }];
    };
  };
}
