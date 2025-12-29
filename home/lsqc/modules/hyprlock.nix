{ ... }:

{
  programs.hyprlock = {
    enable = true;

    extraConfig = ''
      label {
          monitor =
          text = cmd[update:1000] echo "<span>$(date +"%I:%M")</span>"
          color = rgba(216, 222, 233, .75)
          font_size = 40
          font_family = SF Pro Display Bold
          position = 0, 80
          halign = center
          valign = center
      }
    '';

    settings = {
      general = {
        hide_cursor = true;
        ignore_empty_input = true;
      };
      background = [{
        path = "screenshot";
        blur_passes = 3;
        blur_size = 8;
      }];

      input-field = [{
        size = "200, 50";
        position = "0, 0";
        monitor = "";
        dots_center = true;
        fade_on_empty = false;
        # font_color = "rgb(202, 211, 245)";
        # inner_color = "rgb(91, 96, 120)";
        # outer_color = "rgb(24, 25, 38)";
        outline_thickness = 5;
        placeholder_text = "<span>Password...</span>";
        shadow_passes = 2;
      }];
    };
  };
}
