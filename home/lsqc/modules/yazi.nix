{ pkgs, ... }:

{
  programs.yazi = {
    enable = true;

    # https://github.com/stepbrobd/nord.yazi
    plugins = with pkgs.yaziPlugins; { inherit nord yatline full-border; };

    flavors = { inherit (pkgs.yaziPlugins) nord; };

    theme.flavor = {
      light = "nord";
      dark = "nord";
    };

    initLua = # lua
      ''
        require("yatline"):setup({
          theme = require("nord"):setup(),
        })
        require("full-border"):setup {
        	type = ui.Border.ROUNDED,
        }
      '';

    settings = {
      # log = { enabled = false; };
      mgr = {
        show_hidden = true;
        sort_by = "mtime";
        # sort_dir_first = true;
        # sort_reverse = false;
      };
    };
  };
}
