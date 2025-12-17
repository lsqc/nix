{ config, ... }:

{
  services.immich = {
    enable = true;
    port = 3000;
    host = "0.0.0.0";
    openFirewall = true;

    # database = {
    #   enable = true;
    #   port = 3306;
    #   host = "mysql-1.proxima-centauri.lsdevcloud.net";
    #   user = "immich";
    # };

    secretsFile = config.age.secrets.immich-db.path;

    machine-learning = { enable = true; };
  };
}
