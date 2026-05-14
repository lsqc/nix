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
    };
  };
}
