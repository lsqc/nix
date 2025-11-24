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

    languages.language = [
      {
        name = "nix";
        auto-format = true;
        formatter.command = "${pkgs.nixfmt-classic}/bin/nixfmt";
      }
      {
        name = "java";
        auto-format = true;
        formatter.command = "${pkgs.google-java-format}/bin/google-java-format";
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

}
