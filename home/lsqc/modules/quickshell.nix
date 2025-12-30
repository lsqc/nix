{ config, inputs, pkgs, ... }: {
  home.packages = with pkgs;
    [
      qt6Packages.qt5compat
      libsForQt5.qt5.qtgraphicaleffects
      kdePackages.qtbase
      kdePackages.qtdeclarative
      kdePackages.qtstyleplugin-kvantum
      materia-kde-theme
    ] ++ [
      inputs.quickshell.packages.x86_64-linux.default

    ];
}
