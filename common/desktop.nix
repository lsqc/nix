{ lib, pkgs, ... }:

{
  programs = { seahorse = { enable = true; }; };

  environment = {

    variables = {
      BROWSER = "librewolf";
      TERMINAL = "alacritty";
    };

    systemPackages = with pkgs; [

      gimp
      inkscape

      alacritty

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
  };

  # networking.nameservers = [ ];

  # keyring
  services = { gnome.gnome-keyring = { enable = true; }; };

  security.pam.services.login.enableGnomeKeyring = true;

  # fonts
  fonts.packages = with pkgs; [
    dejavu_fonts

    nerd-fonts.fantasque-sans-mono
    nerd-fonts.comic-shanns-mono
  ];
}
