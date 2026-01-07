{ ... }:

{
  programs.waybar = {
    enable = true;
    style = builtins.readFile ../../static/waybar-css;

    settings = [{
      height = 30;
      layer = "top";
      position = "bottom";
      tray = { spacing = 10; };

      modules-left = [ "niri/workspaces" ];
      modules-center = [ "niri/window" ];
      modules-right = [ "pulseaudio" "cpu" "memory" "battery" "clock" "tray" ];

      clock = {
        format = "{:%Y-%m-%d - %H:%M}";
        tooltip-format = "{:%Y-%m-%d - %H:%M}";
      };
      pulseaudio = {
        format = "vol: {volume}%";
        format-muted = "muted ({volume}%)";
      };
      cpu = { format = "cpu: {usage}%"; };
      memory = { format = "mem: {total}/{used}"; };
    }];
  };
}
