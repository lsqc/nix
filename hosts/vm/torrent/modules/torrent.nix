{ config, lib, pkgs, ... }:

let
  peer-port = 51412;
  web-port = 8112;
in {

  services.rtorrent = {
    enable = true;
    port = peer-port;
    package =
      pkgs.rtorrent; # (2025-07-28) upstream develop of rtorrent continued, jesec-rtorrent does not build in nixpkgs
    openFirewall = true;
  };

  services.flood = {
    enable = true;
    port = web-port;
    host = "0.0.0.0";
    openFirewall = true;
    extraArgs = [ "--rtsocket=${config.services.rtorrent.rpcSocket}" ];
  };

  systemd.services.flood.serviceConfig.SupplementaryGroups =
    [ config.services.rtorrent.group ];
}
