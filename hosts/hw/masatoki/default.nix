{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../../common
    ../../../common/grub-uefi.nix

    ./zfs.nix
  ];

  # network shit
  networking.hostName = "masatoki";
  networking.hostId = "9a1a84f2";
  boot.supportedFilesystems = [ "zfs" ];

  environment = {

    systemPackages = with pkgs; [ zfs ];
  };

  # nfs shit
  services.nfs.server = {
    enable = true;
    exports = "\n";
  };

  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 22 2049 80 443 ];
  };

  # system.copySystemConfiguration = true; -> not supported with flakes

}
