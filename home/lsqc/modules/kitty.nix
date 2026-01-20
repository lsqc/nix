{ pkgs, ... }:

{
  programs.kitty = {
    enable = true;

    font = {
      package = pkgs.iosevka;
      name = "Iosevka Nerd Font";
      size = 13;
    };
  };
}
