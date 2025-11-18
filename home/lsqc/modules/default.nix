{ config, lib, pkgs, ... }:

{
  imports = [
    ./helix.nix
    ./git.nix
    ./rofi.nix
    ./zsh.nix
    ./tmux.nix
    ./fnott.nix
    ./swaylock.nix
  ];
}
