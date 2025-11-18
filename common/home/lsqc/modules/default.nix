{ config, lib, pkgs, ... }:

{
  imports = [ ./git.nix ./zsh.nix ./tmux.nix ./fnott.nix ./swaylock.nix ];
}
