{ config, lib, pkgs, ... }:

{
  imports =
    [ ./helix.nix ./git.nix ./zsh.nix ./tmux.nix ./fnott.nix ./swaylock.nix ];
}
