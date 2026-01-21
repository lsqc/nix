hostname := `hostname`

default:
    @just --choose

rebuild:
    home-manager switch --flake .#lsqc

system-rebuild:
    sudo nixos-rebuild switch --flake .#{{hostname}}
