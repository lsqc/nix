{ pkgs, ... }:

{
  programs.kitty = {
    enable = true;

    font = {
      package = pkgs.cascadia-code;
      name = "CaskaydiaCove Nerd Font";
      size = 11;
    };
  };
}
