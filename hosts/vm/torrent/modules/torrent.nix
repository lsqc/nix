{ config, ... }:

{
  services.transmission = {
    enable = true;

    settings = {
      rpc-bind-address = "127.0.0.1";
      download-dir = "/mnt/torrents";
    };
  };

  systemd.services.flood.serviceConfig.SupplementaryGroups =
    [ config.services.transmission.group ];
}
