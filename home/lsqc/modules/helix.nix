{ lib, pkgs, ... }:

let
  lombok-jar = builtins.fetchurl {
    url = "https://projectlombok.org/downloads/lombok.jar";
    sha256 = "01h3aqxkqkc3nmrbxidfppim0snkr9cfxsyfm9mmj9jck7ls921l";
  };
in
{

  # language server packages
  home.packages = with pkgs; [
    svelte-language-server
    tofu-ls
  ];

  programs.helix = {
    enable = true;
    settings = {
      theme = "custom";

      editor = {

        mouse = false;

        true-color = true;
        line-number = "relative";

        inline-diagnostics = {
          cursor-line = "warning";
          other-lines = "disable";
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

        statusline = {
          separator = "|";
        };

        bufferline = "multiple";
        cursorline = true;
        auto-save = true;
        color-modes = true;

        whitespace = {
          render = "all";
        };
      };

      keys = {
        normal = {

          space.space = "file_picker";

          space.v = [
            ":vsplit-new"
            "file_picker"
          ];
          space.H = [
            ":hsplit-new"
            "file_picker"
          ];
          space.w = ":w";
          space.q = ":q";
          space.Q = ":q!";
          space.x = [ ":buffer-close" ];
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
          formatter.command = "${pkgs.nixfmt}/bin/nixfmt";
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
        {
          name = "svelte";
          scope = "source.svelte";
          injection-regex = "svelte";
          file-types = [ "svelte" ];
          roots = [ "package.json" ];
          language-servers = [ "svelteserver" ];
        }
        {
          name = "hcl";
          language-id = "opentofu";
          scope = "source.hcl";
          file-types = [
            "tf"
            "tofu"
            "tfvars"
          ];
          auto-format = true;
          comment-token = "#";
          block-comment-tokens = {
            start = "/*";
            end = "*/";
          };
          indent = {
            tab-width = 2;
            unit = "  ";
          };
          language-servers = [ "tofu-ls" ];
        }
      ];

      language-server = {
        rust-analyzer = {
          command = "${lib.getExe pkgs.rust-analyzer}";
          config = {
            check = {
              command = "${lib.getExe pkgs.clippy}";
            };
            cargo = {
              features = "all";
            };
          };
        };
        nixd = {
          command = "${lib.getExe pkgs.nixd}";
        };

        typos = {
          command = "${lib.getExe pkgs.typos-lsp}";
        };

        jdtls = {
          command = "${lib.getExe pkgs.jdt-language-server}";
          args = [ "--jvm-arg=-javaagent:${lombok-jar}" ];
        };

        svelteserver = {
          command = "svelteserver";
          args = [ "--stdio" ];
        };

        tofu-ls = {
          command = "${lib.getExe pkgs.tofu-ls}";
          args = [ "serve" ];
        };
      };
    };

    themes = {
      custom = {
        "inherits" = "fleet_dark";
        "ui.background" = {
          bg = "#000000";
        };
        "ui.linenr.selected" = {
          fg = "#00ff95";
          modifiers = [ "bold" ];
        };
        # diagnostics
        "diagnostic.hint" = {
          "underline" = {
            "style" = "curl";
          };
        };
        "diagnostic.info" = {
          "underline" = {
            "style" = "curl";
          };
        };
        "diagnostic.warning" = {
          "underline" = {
            "style" = "curl";
          };
        };
        "diagnostic.error" = {
          "underline" = {
            "style" = "curl";
          };
        };
        "diagnostic.unnecessary" = {
          "underline" = {
            "style" = "curl";
          };
        };
        "diagnostic.deprecated" = {
          "underline" = {
            "style" = "curl";
          };
        };

        # statusline
        "ui.statusline.normal" = {
          fg = "#ffffff";
          bg = "#a245ff";
          modifiers = [ "bold" ];
        };
        "ui.statusline.insert" = {
          fg = "#ffffff";
          bg = "#6b10cc";
        };
        "ui.statusline.select" = {
          fg = "#ffffff";
          bg = "#cc10aa";
        };
        "ui.statusline.inactive" = {
          fg = "#ffffff";
          bg = "#1e1e2e";
        };
      };
    };
  };
}
