{ config, pkgs, ...}:

{
  imports = 
    [
      ./caddy.nix
      ./hydra.nix
    ];
}
