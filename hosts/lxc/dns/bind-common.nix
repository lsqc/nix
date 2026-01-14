{ config, lib, inputs, pkgs, ... }:

{
  services.bind = {
    enable = true;

    cacheNetworks = [ "127.0.0.0/8" "10.42.0.0/16" ];
    # zones = {
    #   "pc.ip.nya.vodka" = { allowQuery = [ "10.0.0.0/8" ]; };
    #   "nya.vodka" = { allowQuery = [ "10.0.0.0/8" ]; };
    # };

    forward = "only";
    forwarders = [ "10.42.0.2" "10.42.0.3" "10.42.0.4" ];

    zones = {
      "pc.ip.nya.vodka" = {
        master = true;
        slaves = [ "10.42.0.6" "10.42.0.7 " ];
        file = let
          zoneTemplate = ../../../dns/pc.ip.nya.vodka.zone;
          serialTimestamp = lib.strings.trim (builtins.readFile
            (pkgs.runCommand "zone-serial" { } ''
              date +%s > $out
            ''));

          content = builtins.readFile zoneTemplate;
          updatedZone =
            builtins.replaceStrings [ "serial-number" ] [ serialTimestamp ]
            content;

          finalZone = updatedZone + "\n";

        in pkgs.writeText "pc.ip.nya.vodka.zone" finalZone;
      };
    };
    extraOptions = ''
      recursion yes;
      allow-recursion { any; };

      # forward only;
      # forwarders {
      #   1.1.1.1;
      #   9.9.9.9;
      # };

      dnssec-validation auto;
      listen-on { any; };
      listen-on-v6 { any; };
    '';
  };

  networking.firewall = {
    allowedTCPPorts = [ 22 53 ];
    allowedUDPPorts = [ 53 ];
  };
}

