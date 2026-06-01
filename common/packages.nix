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
    dig
    file
    nixos-anywhere
    age
  ];
}
