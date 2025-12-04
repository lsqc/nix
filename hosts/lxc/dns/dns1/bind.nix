{ config, lib, inputs, pkgs, ... }:

{
  services.bind = {
    enable = true;

    zones = {
      "pc.nya.vodka" = {
        master = true;
        slaves = [ "10.42.0.6" "10.42.0.7 " ];
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

  networking.firewall = {
    allowedTCPPorts = [ 22 53 ];
    allowedUDPPorts = [ 53 ];
  };
}

