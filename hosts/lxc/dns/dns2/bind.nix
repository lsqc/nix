{ config, lib, inputs, pkgs, ... }:

{
  services.bind = {
    zones = {
      "pc.nya.vodka" = {
        master = false;
        masters = [ "10.42.0.5" ];
        allowQuery = [ "10.0.0.0/8" ];
        file = let
          zoneTemplate = ../../../../dns/pc.nya.vodka.zone;
          serialTimestamp = lib.strings.trim (builtins.readFile
            (pkgs.runCommand "zone-serial" { } ''
              date +%s > $out
            ''));

          content = builtins.readFile zoneTemplate;
          updatedZone =
            builtins.replaceStrings [ "serial-number" ] [ serialTimestamp ]
            content;

          finalZone = updatedZone + "\n";

        in pkgs.writeText "pc.nya.vodka.zone" finalZone;
      };
    };
  };
}

