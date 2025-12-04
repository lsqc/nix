{ pkgs, ... }:

{
  services.bind = {
    zones = {
      "pc.nya.vodka" = {
        master = true;
        file = let
          content = builtins.readFile ../../../common/dns/pc.nya.vodka.zone;
          zone =
            builtins.replaceStrings [ "serial-number" ] [ builtins.currentTime ]
            content;
        in pkgs.writeText "pc.nya.vodka.zone" zone;
      };
    };
  };
}
