{ ... }:

{
  imports = [
    ./hardware-configuration.nix

    ../../../common
    ../../../common/desktop.nix

    ./modules

  ];

  networking = {
    hostName = "t420";
    networkmanager.enable = true;
    #    resolvconf.enable = true;
  };

  # time shit
  time.timeZone = "Europe/Berlin";

  programs = {
    nix-ld.enable = true;

    hyprland = {
      enable = true;
      withUWSM = true;
      xwayland.enable = true;
    };
  };
}
