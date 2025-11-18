# TODO: move all this shit into modules
# ---

{ config, pkgs, lib, ... }:

{

  programs = {
    yazi = { enable = true; };

    # web browser
    librewolf = {
      enable = true;
      settings = {
        "webgl.disabled" = false;
        "privacy.clearOnShutdown.history" = false;
        "privacy.clearOnShutdown.cookies" = false;
      };
    };
    element-desktop = { enable = true; };
  };
}
