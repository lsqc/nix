{ pkgs, ... }:

{
  programs.alacritty = {
    enable = true;
    package = pkgs.alacritty;
    theme = "hyper";
    themePackage = pkgs.alacritty-theme;

    settings = {
      keyboard.bindings = [{
        key = "K";
        mods = "Control";
        chars = "\\u000c";
      }];
    };
  };
}
