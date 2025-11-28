{ pkgs, ... }:

{
  programs.helix = {
    enable = true;
    settings = {
      theme = "catppuccin_frappe_transparent";

      editor = {

        mouse = false;
        line-number = "relative";
        lsp.display-messages = true;

        inline-diagnostics = {
          cursor-line = "hint";
          other-lines = "hint";
        };

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

        insert = { "C-c" = "normal_mode"; };
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
          formatter.command =
            "${pkgs.google-java-format}/bin/google-java-format";
        }

        {
          name = "rust";
          auto-format = true;
          formatter.command = "${pkgs.rustfmt}/bin/rustfmt";
        }
      ];

      language-server = {
        rust-analyzer = {
          command = "${pkgs.rust-analyzer}/bin/rust-analyzer";
          config = {
            check = { command = "${pkgs.clippy}/bin/cargo-clippy"; };
            cargo = { features = "all"; };
          };
        };
      };
    };

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

}
