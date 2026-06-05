{ ... }:

{
  programs = {
    sway.enable = true;
    firefox.enable = true;
  };

  # sway config
  environment.etc."sway/config" = {
    text = ''
      exec swaymsg seat '*' hide_cursor 100
      exec firefox --kiosk --private-window https://info-display.lab.nya.vodka
    '';
  };

  services = {
    displayManager = {
      gdm = {
        enable = true;
      };
      autoLogin = {
        enable = true;
        user = "display";
      };
      defaultSession = "sway";
    };
  };
}
