{ config, lib, inputs, pkgs, ... }:

{
  services.bind = {

    zones = {
      "pc.nya.vodka" = {
        master = true;
        slaves = [ "10.42.0.6" "10.42.0.7 " ];
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

