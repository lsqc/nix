hostname := `hostname`
user := `whoami`

default:
    @just --choose

rebuild:
    home-manager switch --flake .#{{hostname}}

system-rebuild:
    sudo nixos-rebuild switch --flake .#{{hostname}}
