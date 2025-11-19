{ lib, pkgs, ... }:

{

  imports = [ ./ssh.nix ./users.nix ./packages.nix ];

  # enable flakes and new cli
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  networking = {
    nameservers = [
      "10.42.0.2"
      "10.42.0.3"
      "10.42.0.4"
      # "10.42.101.1" # brokey brokey
      "10.1.0.1"
      "10.1.0.2"
    ];
  };

  # timezone
  time.timeZone = "Europe/Berlin";

  # language 
  i18n.defaultLocale = "en_US.UTF-8";

  environment = {

    # set helix as default editor because who the fuck uses nano
    variables = { EDITOR = "hx"; };

    # aliases
    shellAliases = {
      vim = "hx";
      vi = "hx";
      nvim = "hx";
      ls = "ls -lsah";
      ll = "ls -l";
      la = "ls -a";
      cat = "bat";
    };
  };

}

