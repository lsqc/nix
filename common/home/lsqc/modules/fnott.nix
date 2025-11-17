{ config, lib, pkgs, ... }:

{
  services.fnott = {
    enable = true;

    settings = {
      main = {
        notification-margin = 5;

      };

      low = {
        timeout = 5;
        title-font = "unifont";
        title-color = "ffffff";
      };
    };
  };
}
