{ config, pkgs, ...}:

{
  services.hydra = {
    enable = true;
    hydraURL = "http://localhost:3000";
    notificationSender = "hydra@pc.nya.vodka";
    buildMachinesFiles = [ ];
    useSubstitutes = true;
  };
}
