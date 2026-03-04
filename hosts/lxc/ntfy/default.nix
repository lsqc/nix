{ modulesPath, ... }:

{
  imports = [
    (modulesPath + "/virtualisation/proxmox-lxc.nix")

    ../../../common
    ./ntfy.nix
    ./firewall.nix

  ];

  nix.settings = { sandbox = false; };
  proxmoxLXC = {
    manageNetwork = false;
    privileged = false;
  };
}

