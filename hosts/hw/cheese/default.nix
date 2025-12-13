{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix

    ../../../common
    ../../../common/grub-uefi.nix

    ./modules
  ];

  environment.systemPackages = with pkgs; [ iperf3 ];

  networking = {

    hostName = "cheese";

    firewall = {
      enable = false;
      allowedTCPPorts = [ 22 80 443 8080 5201 ];
    };
  };

  services.openssh.settings.PrintMotd = true;
}
