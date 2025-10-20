{ config, pkgs, ... }:

{
  programs.librewolf = {
    enable = true;
    settings = {
      "webgl.disabled" = false;
      "privacy.clearOnShutdown.history" = false;
      "privacy.clearOnShutdown.cookies" = false;
    };

    preferences = {
      
    };
  };
}
