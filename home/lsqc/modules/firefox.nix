{ pkgs, inputs, ... }:

{
  programs.firefox = {

    enable = true;

    policies = {
      DisableTelemetry = true;
      DisableFirefoxStudies = true;
      DontCheckDefaultBrowser = true;
      DisablePocket = true;
      ExtensionSettings = {
        "uBlock0@raymondhill.net" = {
          install_url =
            "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          installation_mode = "force_installed";
        };
      };
    };

    profiles.lsqc = {
      isDefault = true;

      extensions.packages =
        with inputs.firefox-addons.packages.${pkgs.system}; [
          ublock-origin
          sponsorblock

          bitwarden

          user-agent-string-switcher
          darkreader
          # firefox-color

          vimium
        ];

      bookmarks = {
        force = true;
        settings = [{
          toolbar = true;
          bookmarks = [{
            name = "home";
            bookmarks = [
              {
                name = "dashboard";
                url = "https://uwu.nya.vodka";
              }
              {
                name = "jellyfin";
                url = "https://jellyfin.nya.vodka";
              }
            ];
          }];
        }];
      };

      settings = {
        "privacy.donotttrackheader.enabled" = true;
        "browser.theme.content-theme" = "dark";
        "browser.theme.browser-theme" = "dark";
        "browser.newtabpage.activity-stream.showSponsored" = false;
        "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
      };

      userChrome = builtins.readFile ../../../assets/firefox-theme.css;

      search.engines = {
        nix-packages = {
          name = "Nix Packages";
          urls = [{
            template = "https://search.nixos.org/packages";
            params = [
              {
                name = "type";
                value = "packages";
              }
              {
                name = "query";
                value = "{searchTerms}";
              }
            ];
          }];

          icon =
            "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
          definedAliases = [ "@np" ];
        };

        nix-options = {
          name = "Nix Options";
          urls = [{
            template = "https://search.nixos.org/options";
            params = [
              {
                name = "type";
                value = "options";
              }
              {
                name = "query";
                value = "{searchTerms}";
              }
            ];
          }];

          icon =
            "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
          definedAliases = [ "@no" ];
        };

        nixos-wiki = {
          name = "NixOS Wiki";
          urls = [{
            template =
              "https://wiki.nixos.org/w/index.php?search={searchTerms}";
          }];
          iconMapObj."16" = "https://wiki.nixos.org/favicon.ico";
          definedAliases = [ "@nw" ];
        };

        nix-dev = {
          urls = [{
            template = "https://nix.dev/search.html";
            params = [{
              name = "q";
              value = "{searchTerms}";
            }];
          }];
          icon =
            "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
          definedAliases = [ "@nd" ];
        };

        yt = {
          name = "YouTube";
          urls = [{ template = "https://youtube.com/search?q={searchTerms}"; }];
          # iconMapObj."16" = "https://wiki.nixos.org/favicon.ico";
          iconUpdateUrl = "https://youtube.com/favicon.ico";
          definedAliases = [ "@yt" ];
        };

        google.metaData.alias = "@g";
      };
    };
  };
}
