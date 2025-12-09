{ config, lib, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../../common
    ../../../common/vm.nix

    ./users.nix
  ];

  boot.loader.grub.enable = true;
  boot.loader.grub.efiSupport = true;
  boot.loader.grub.device = "/dev/sda";

  networking.hostName = "cookie";

  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 80 10690 6969 22 ];
  };

  time.timeZone = "Europe/Berlin";

  environment.systemPackages = with pkgs; [
    neovim
    wget
    curl
    git
    jdk21_headless
    screen
  ];

  systemd.services.mcfolia = {
    enable = true;
    description = "minecraft folia server";
    after = [ "network-online.target" ];
    wantedBy = [ "default.target" ];

    serviceConfig = {
      ExecStart =
        "/run/current-system/sw/bin/screen -DmS mc-folia /home/minecraft/minecraft-1.21/start.sh";
      ExecStop = "/run/current-system/sw/bin/screen -S mc-folia -X quit";
      WorkingDirectory = "/home/minecraft/minecraft-1.21";
      User = "minecraft";
      Restart = "on-failure";
      RestartSec = 30;
    };
  };

  # system.stateVersion = "25.05"; 
}

