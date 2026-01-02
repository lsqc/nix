{ ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../../common
    ../../../common/vm.nix
    ../../../common/grub-uefi.nix

    ../../../common/prometheus-exporter.nix

    ./modules
  ];

  networking = {
    hostName = "prometheus";

    firewall = {
      enable = true;
      allowedTCPPorts = [ 22 80 443 3000 ];
    };
  };

  time.timeZone = "Europe/Berlin";

  # system.stateVersion = "25.05"; 
}

