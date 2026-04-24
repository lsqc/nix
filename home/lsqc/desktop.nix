{ ... }:

let themeSettings = import ./theme-settings.nix;
in {

  gtk = {
    enable = true;

    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = true;
      gtk-font-name = "Sans ${toString themeSettings.fontSize}";
    };
  };
}
