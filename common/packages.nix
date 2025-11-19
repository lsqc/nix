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
    neofetch
    dig
    file
    nixos-anywhere
  ];
}
