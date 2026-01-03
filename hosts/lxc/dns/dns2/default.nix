{ modulesPath, ... }:

{
  imports = [
    (modulesPath + "/virtualisation/proxmox-lxc.nix")

    ../../../../common

    ./bind.nix
    ../bind-common.nix

    ../prometheus.nix
  ];

  nix.settings = { sandbox = false; };

  proxmoxLXC = {
    manageNetwork = false;
    privileged = false;
  };

}
