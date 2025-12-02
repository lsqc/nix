{ config, modulesPath, pkgs, lib, ... }:

{
  imports = [
    (modulesPath + "/virtualisation/proxmox-lxc.nix")

    ../../../common
    ./minecraft.nix
  ];

  nix.settings = { sandbox = false; };
  proxmoxLXC = {
    manageNetwork = false;
    privileged = false;
  };

  environment.systemPackages = with pkgs; [ openjdk21 ];

  # security.pam.services.sshd.allowNullPassword = true;
  system.stateVersion = lib.mkForce "25.05";
}

