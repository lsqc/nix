{ pkgs, ... }: {

  xsession.windowManager.i3 = {
    enable = true;

    package = pkgs.i3;
    extraConfig = builtins.readFile ../../static/i3-config;

    config = { bars = [ ]; };
  };
}
