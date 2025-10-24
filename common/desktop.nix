{ lib, pkgs, ... }:

{

  programs = { seahorse = { enable = true; }; };

  environment.systemPackages = with pkgs; [

    gimp
    inkscape

    librewolf
    keepassxc

    vesktop
    openscad

    telegram-desktop
    signal-desktop
    thunderbird
    pidgin

    prusa-slicer
    tor-browser

    pavucontrol
    alacritty

    yazi

  ];

  # keyring
  services = { gnome.gnome-keyring = { enable = true; }; };

  security.pam.services.login.enableGnomeKeyring = true;
}
