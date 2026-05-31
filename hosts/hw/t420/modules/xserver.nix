{ pkgs, ... }: {

  programs.niri.enable = true;
  services = {

    displayManager = {

      defaultSession = "niri";
      gdm = {
        enable = true;
        # wayland = true;
      };
    };

    xserver = {

      enable = true;

      xkb.layout = "eu";
      displayManager.startx.enable = true;

      videoDrivers = [ "modesetting" ];

      windowManager.i3 = {
        enable = true;
        extraPackages = with pkgs; [
          i3status
          i3blocks
          networkmanagerapplet
          rofi
        ];
      };
    };
  };
}
