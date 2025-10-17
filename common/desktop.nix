{ lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [

    gimp
    inkscape

    librewolf
    keepasscx

    vesktop
    openscad
    
    telegram-desktop
    signal-desktop
    thunderbird
    pidgin

    prusaslicer
    tor-browser

    pavucontrol
    alacritty

    yazi

  ];
}
