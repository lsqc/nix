{ ... }:

{
  programs.fuzzel = {
    enable = true;

    settings = {
      colors = {
        text = "ffffffff";
        background = "000000cc";
      };
      border = { radius = 0; };
      main = { font = "Comic Shanns Mono Nerd Font:size=11"; };
    };
  };
}
