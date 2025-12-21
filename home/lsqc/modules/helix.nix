{ lib, pkgs, ... }:

{
  programs.helix = {
    enable = true;
    settings = {
      theme = "catppuccin_frappe_transparent";

      editor = {

        mouse = false;

        true-color = true;
        line-number = "relative";

        inline-diagnostics = {
          cursor-line = "hint";
          other-lines = "hint";
        };

        cursor-shape = {
          normal = "block";
          insert = "bar";
          select = "underline";
        };

        lsp = {
          display-messages = true;
          display-progress-messages = true;
        };

        end-of-line-diagnostics = "hint";

        statusline = { separator = "|"; };

        bufferline = "multiple";
        cursorline = true;
        auto-save = true;

        whitespace = { render = "all"; };
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

        insert = {
          "C-c" = "normal_mode";
          "C-h" = "hover";
        };
      };
    };

    languages = {
      language = [
        {
          name = "nix";
          auto-format = true;
          formatter.command = "${pkgs.nixfmt-classic}/bin/nixfmt";
        }
        {
          name = "java";
          auto-format = true;
          formatter.command = "${lib.getExe pkgs.google-java-format}";
        }
        {
          name = "rust";
          auto-format = true;
          formatter.command = "${pkgs.rustfmt}/bin/rustfmt";
        }
        {
          name = "markdown";
          auto-format = true;
          language-servers = [ "typos" ];
        }
      ];

      language-server = {
        rust-analyzer = {
          command = "${lib.getExe pkgs.rust-analyzer}";
          config = {
            check = { command = "${lib.getExe pkgs.clippy}"; };
            cargo = { features = "all"; };
          };
        };
        nixd = { command = "${lib.getExe pkgs.nixd}"; };

        typos = { command = "${lib.getExe pkgs.typos-lsp}"; };

        jdtls = { command = "${lib.getExe pkgs.jdt-language-server}"; };

      };
    };

    themes = {
      catppuccin_frappe_transparent = {
        "inherits" = "catppuccin_frappe";
        "ui.background" = { };
        "ui.linenr.selected" = { fg = "#FB508F"; };
      };
    };
  };

}
