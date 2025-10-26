{ config, pkgs, ...}:
{
  services.minecraft-server = {
    enable = true;
    eula = true; 
    openFirewall = true;
    declarative = true;
    dataDir = "/mnt/nya/minecraft";

    package = pkgs.papermc;

    whitelist = {
      lsqc = "c32bb0f4-eda0-477c-b16c-87390a7979b8";
    };

    serverProperties = {
      max-players = 50;
      online-mode = false;
      white-list = true;
    };

    jvmOpts = "-Xms8G -Xmx8G";
  };
}
