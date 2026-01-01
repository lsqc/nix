{ config, ... }:

{
  services.caddy = {
    enable = true;
    virtualHosts = {

      "git2.nya.vodka" = {
        extraConfig = ''
          reverse_proxy http://localhost:${
            toString config.services.forgejo.settings.server.HTTP_PORT
          }
        '';

      };
    };
  };
}
