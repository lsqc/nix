{ config, lib, pkgs, ... }:

{
  imports = [
    #    ./hardware-configuration.nix

    ../../../common
    ../../../common/desktop.nix

    ./modules
  ];

  services = {

    printing = { enable = true; };

    resolved = { enable = true; };

    xserver = {

      enable = true;

      xkb.layout = "eu";
      displayManager.startx.enable = true;

      #    videoDrivers = [ "modesetting" ];
    };
  };

  programs = {
    nix-ld.enable = true;

    hyprland = {
      enable = true;
      withUWSM = true;
      xwayland.enable = true;
    };
  };

  environment = {
    systemPackages = with pkgs; [
      wget
      hyfetch
      scrot
      wireshark
      tcpdump
      nix-ld
      pulseaudio
    ];
  };

  system.stateVersion = "25.05"; # Did you read the comment?

}
