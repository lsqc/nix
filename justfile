default:
    @just --choose

rebuild:
    home-manager switch --flake .#lsqc
