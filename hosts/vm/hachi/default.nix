{ ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../../common
    ../../../common/vm.nix
    ../../../common/grub-uefi.nix

    ./modules
  ];

  networking = {
    hostName = "hachi";

    firewall = {
      enable = true;
      # port 3000 required for reverse proxy
      allowedTCPPorts = [ 22 80 443 3000 ];
    };
  };

  time.timeZone = "Europe/Berlin";

}
