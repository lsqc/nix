{ config, pkgs, lib, ... }:

{
  programs = {

    tmux = {
      enable = true;
      shell = "${pkgs.zsh}/bin/zsh";
      terminal = "tmux-256color";
      historyLimit = 1000000;
      plugins = with pkgs; [ tmuxPlugins.catppuccin ];
    };

    # shell
    zsh = {
      enable = true;
      oh-my-zsh = {
        enable = true;
        theme = "robbyrussell";
        plugins = [ "git" ];
      };
    };

    git = {
      enable = true;
      userEmail = "lsqc@nya.vodka";
      userName = "lsqc";

      signing = {
        format = "ssh";
        signByDefault = true;

        key = "~/.ssh/gitkey";
      };
      aliases = {
        st = "status";
        c = "commit";
        me = "merge";
        cp = "cherry-pick";
        b = "branch";
        co = "checkout";
      };
    };

    yazi = { enable = true; };

    # web browser
    librewolf = {
      enable = true;
      settings = {
        "webgl.disabled" = false;
        "privacy.clearOnShutdown.history" = false;
        "privacy.clearOnShutdown.cookies" = false;
      };
    };

    # text editor
    helix = {
      enable = true;
      settings = {
        theme = "catppuccin_frappe_transparent";

        editor = {

          mouse = false;
          line-number = "relative";
          lsp.display-messages = true;

          cursor-shape = {
            normal = "block";
            insert = "bar";
            select = "underline";
          };
        };

        keys = {
          normal = {

            esc = [ "collapse_selection" "keep_primary_selection" ];
            space.space = "file_picker";

            space.w = ":w";
            space.q = ":q";
          };
        };
      };

      languages.language = [
        {
          name = "nix";
          auto-format = true;
          formatter.command = "${pkgs.nixfmt-classic}/bin/nixfmt";
        }
        {
          name = "java";
          auto-format = true;
          formatter.command =
            "${pkgs.google-java-format}/bin/google-java-format";
        }
      ];

      themes = {
        catppuccin_frappe_transparent = {
          "inherits" = "catppuccin_frappe";
          "ui.background" = { };
          "ui.linenr.selected" = {
            # fg = "#4a269e";
            modifiers = [ "bold" ];
          };
        };
      };
    };

    element-desktop = { enable = true; };
  };
}
