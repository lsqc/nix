{ config, pkgs, ...}:

{
  services.caddy = {
    enable = true;
    virtualHosts = {

      "lsdevcloud.net".extraConfig = ''
        reverse_proxy https://prce-public-1.lsdevcloud.net
      '';

      "nya.vodka".extraConfig = ''
        reverse_proxy https://prce-public-2.lsdevcloud.net
      '';

    };
  };
}
