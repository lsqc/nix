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
        "browser.theme.content-theme" = "0";
        "browser.theme.toolbar-theme" = "0";
        "browser.newtabpage.activity-stream.showSponsored" = false;
        "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
      };

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

        nixos-wiki = {
          name = "NixOS Wiki";
          urls = [{
            template =
              "https://wiki.nixos.org/w/index.php?search={searchTerms}";
          }];
          iconMapObj."16" = "https://wiki.nixos.org/favicon.ico";
          definedAliases = [ "@nw" ];
        };

        bing.metaData.hidden = true;
        google.metaData.alias = "@g";
      };
    };
  };
}
