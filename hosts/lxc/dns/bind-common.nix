{ config, lib, inputs, pkgs, ... }:

{
  services.bind = {
    enable = true;

    zones = { "pc.nya.vodka" = { allowQuery = [ "10.0.0.0/8" ]; }; };

    forward = "first";
    forwarders = [ "10.42.0.2" "10.42.0.3" "10.42.0.4" ];
  };

  networking.firewall = {
    allowedTCPPorts = [ 22 53 ];
    allowedUDPPorts = [ 53 ];
  };
}

