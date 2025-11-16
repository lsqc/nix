{ config, pkgs, ...}:

{
  services.caddy = {
    enable = true;
    virtualHosts = {

      "hydra.nya.vodka" = {
        extraConfig = ''
          reverse_proxy http://localhost:3000
        '';

      };
    };
  };
}
