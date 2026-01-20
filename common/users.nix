{ ... }:

let keys = import ./keys.nix;
in {
  users.users.lsqc = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    openssh.authorizedKeys.keys = keys.lsqc;
  };

  users.users.root.openssh.authorizedKeys.keys = keys.root;
}

