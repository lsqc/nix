{ config, ... }:

{
  gtk = {
    enable = true;

    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = true;
      gtk-font-name = "Sans ${toString config.theme.font.size}";
    };
  };
}
