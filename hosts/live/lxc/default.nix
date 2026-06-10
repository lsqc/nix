{ modulesPath, ... }:

{
  imports = [
    ../../../common/lxc.nix
    ./firewall.nix
    ../../../common/users.nix

    (modulesPath + "/virtualisation/proxmox-lxc.nix")
  ];

  services.openssh.enable = true;
}
