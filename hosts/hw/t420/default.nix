{ ... }:

{
  imports = [
    ./hardware-configuration.nix

    ../../../common
    ../../../common/desktop.nix
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

  system.stateVersion = "25.05";
}
