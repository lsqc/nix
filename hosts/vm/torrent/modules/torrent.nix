{ config, pkgs, ... }:

{

  services.rtorrent = {
    enable = true;
    port = 51412;
    package = pkgs.rtorrent;
    openFirewall = true;
  };

  systemd.services.flood.serviceConfig.SupplementaryGroups =
    [ config.services.rtorrent.group ];
}
