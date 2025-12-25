{ lib, ... }:

{
  programs.i3status = {
    enable = true;
    modules = lib.mkForce {
      "volume master" = {
        position = 1;
        settings = {
          format = "vol %volume";
          format_muted = "vol: muted (%volume)";
          device = "default";
          mixer = "Master";
          mixer_idx = 0;
        };
      };
      "battery 0" = {
        position = 2;
        settings = {
          format = "%status %percentage %remaining %emptytime";
          path = "/sys/class/power_supply/BAT%d/uevent";
          low_threshold = 10;
        };
      };
      "load" = {
        position = 3;
        settings = { format = "load %5min"; };
      };
      "tztime local" = {
        position = 4;
        settings = {

          format = "%Y-%m-%d %H:%M:%S";
          hide_if_equals_localtime = false;
        };
      };
      "memory" = {
        position = 5;
        settings = {
          format = "mem %used/%total";
          threshold_degraded = "10%";
          format_degraded = "MEMORY: %used/%total";
        };
      };
    };
  };
}
