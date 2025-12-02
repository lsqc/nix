{ config, ... }:

{

  services.flood = {
    enable = true;
    port = 8112;
    host = "0.0.0.0";
    openFirewall = true;
    extraArgs = [ "--rtsocket=${config.services.rtorrent.rpcSocket}" ];
  };

}
