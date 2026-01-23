{ pkgs, ... }:

{
  programs.kitty = {
    enable = true;

    font = {
      package = pkgs.nerd-fonts._0xproto;
      name = "0xProto Nerd Font";
      size = 13;
    };
  };
}
