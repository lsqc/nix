{ config, pkgs, ... }:

{
  imports = [ ./torrent.nix ./flood.nix ];
}
