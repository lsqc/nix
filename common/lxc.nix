{ modulesPath, ... }: {
  imports = [ (modulesPath + "/virtualisation/proxmox-lxc.nix") ./default.nix ];

  nix.settings = { sandbox = false; };
  proxmoxLXC = {
    manageNetwork = false;
    privileged = false;
  };
}
