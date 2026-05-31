{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    helix
    wget
    git
    curl
    tmux
    bat
    btop
    hyfetch
    dig
    file
    nixos-anywhere
    age
  ];
}
