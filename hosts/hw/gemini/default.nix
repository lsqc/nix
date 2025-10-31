{ config, lib, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix

      ../../../common
      ../../../common/grub-uefi.nix
      
      ./nvidia.nix

      ./modules/ollama.nix
     ];

  environment = {
    systemPackages = with pkgs; [
      librechat
    ];
  };

  networking = {

    hostName = "gemini";

    firewall = {
      enable = true;
      allowedTCPPorts = [ 22 80 443 8080 ];
    };
  };
}
