{ config, modulesPath, pkgs, lib, ...}:

{
  imports = 
    [ 
      (modulesPath + "/virtualisation/proxmox-lxc.nix")

      ../../../common
      ./minecraft.nix
    ];

  nix.settings = { sandbox = false; };
  proxmoxLXC = {
    manageNetwork = false;
    privileged = false;
  };

  # security.pam.services.sshd.allowNullPassword = true;
  system.stateVersion = "25.05";
}

