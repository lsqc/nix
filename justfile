hostname := `hostname`
user := `whoami`

default:
    @just --choose

rebuild:
    home-manager switch --flake .#{{user}}

system-rebuild:
    sudo nixos-rebuild switch --flake .#{{hostname}}
