{ config, pkgs, ... }: {
  imports = [
    (builtins.fetchTarball {
      url =
        "https://gitlab.com/simple-nixos-mailserver/nixos-mailserver/-/archive/nixos-25.11/nixos-mailserver-nixos-25.11.tar.gz";
      sha256 = "16kanlk74xnj7xgmjsj7pahy31hlxqcbv76xnsg8qbh54b0hwxgq";
    })
  ];

  mailserver = {
    enable = true;
    stateVersion = 3;
    fqdn = "mail.pc.nya.vodka";
    domains = [ "pc.nya.vodka" ];

    loginAccounts = {
      "pve@pc.nya.vodka" = {
        hashedPasswordFile = "/mail/pve-pw";
        aliases = [ "proxmox@pc.nya.vodka" ];
      };
    };

    certificateScheme = "selfsigned";
  };
  # security.acme.acceptTerms = true;
  # security.acme.defaults.email = "security@example.com";
}
