{ config, pkgs, ... }:

{
  imports = [ ./caddy.nix ./forgejo.nix ];
}
