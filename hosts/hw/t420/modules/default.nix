{ ... }:

{
  imports = [
    ./xserver.nix
    ./resolved.nix
    ./bluetooth.nix
    ./logind.nix
    ./audio.nix
    ./printing.nix
  ];
}
