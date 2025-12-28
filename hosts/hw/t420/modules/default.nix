{ ... }:

{
  imports = [
    ./adb.nix
    ./xserver.nix
    ./resolved.nix
    ./bluetooth.nix
    ./logind.nix
    ./audio.nix
    ./printing.nix
    ./bootloader.nix
    ./39c3-wifi.nix
    ./cosmic.nix
  ];
}
