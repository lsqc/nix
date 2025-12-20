{ pkgs, ... }: {

  services.xserver = {

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
}
