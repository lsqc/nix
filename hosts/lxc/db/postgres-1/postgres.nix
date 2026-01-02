{ config, pkgs, ... }:

{
  services.postgresql = {
    enable = true;
    package = pkgs.postgresql_15;

    ensureUsers = [
      {
        name = "immich";
        ensureDBOwnership = true;
      }
      {
        name = "postgres";
        ensureDBOwnership = true;
      }
    ];

    ensureDatabases = [ "immich" "postgres" ];

    authentication = pkgs.lib.mkOverride 10 ''
      local   all             all                                     scram-sha-256
      host    all             all             127.0.0.1/32            scram-sha-256
      host    all             all             ::1/128                 scram-sha-256
      host    immich          immich          10.42.0.66/32           scram-sha-256
    '';

    initialScript = pkgs.writeText "init-sql-script" ''
      CREATE DATABASE immich;
      CREATE ROLE immich WITH LOGIN PASSWORD file.read('${config.age.secrets.postgres-immich-pw.path}');
      GRANT ALL PRIVILEGES ON DATABASE immich TO immich;
    '';
    settings = { password_encryption = "scram-sha-256"; };
  };

  age.secrets = {

    postgres-immich-pw = {
      file = ../../../../secrets/postgres-immich-pw.age;
      owner = "postgres";
    };
    postgres-postgres-pw = {
      file = ../../../../secrets/postgres-postgres-pw.age;
      owner = "postgres";
    };
  };
}
