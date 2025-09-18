{ config, pkgs, ... }:

{
  users = {
    groups.minecraft = {};

    extraUsers.minecraft = {
      isSystemUser = true;
      group = "minecraft";
      home = "/var/minecraft";
      createHome = true;
      packages = with pkgs; [
        openjdk17
      ];
    };
  };

  # https://gist.github.com/cyber-murmel/4aeae3b5dafc72f12827b3284a9da481
  systemd.services.minecraft = {
    enable = true;
    description = "Forge Minecraft Server";
    serviceConfig = {
      ExecStart = "${pkgs.openjdk17}/bin/java -Xms1G -Xmx8G -jar ./forge.jar nogui";
      WorkingDirectory = "${config.users.extraUsers.minecraft.home}/forge";
      Restart = "always";
      RestartSec = 60;
    };
    after = [ "network.target" ];
    wantedBy = [ "default.target" ];
  };
}
