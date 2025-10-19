{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    adapta-gtk-theme
    paper-icon-theme
  ];

  gtk = {
    enable = true;

    theme = {
      name = "Adapta-Nokto";
      package = pkgs.adapta-gtk-theme;
    };

    iconTheme = {
      name = "Paper"; 
      package = pkgs.paper-icon-theme;
    };

    gtk3.extraConfig = { 
      gtk-application-prefer-dark-theme = true;
    };
  };
}
