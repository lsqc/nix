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

      shellAliases = {
        zi = "yazi";
        ed = "hx";
        vi = "hx";
        vim = "hx";
        nvim = "hx";
      };

      initContent = ''
        PROMPT="%F{147}%n%F{122}::%F{61}%m %F{255}∈ %F{69}%~%F{14}%f %F{79}λ %F{255}"
      '';
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

      extraConfig = { init = { defaultBranch = "main"; }; };
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

            space.space = "file_picker";

            space.v = [ ":vsplit-new" "file_picker" ];
            space.H = [ ":hsplit-new" "file_picker" ];
            space.w = ":w";
            space.q = ":q";
            space.Q = ":q!";
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
            fg = "#FB508F";
            # modifiers = [ "bold" ];
          };
        };
      };
    };

    element-desktop = { enable = true; };
  };
}
