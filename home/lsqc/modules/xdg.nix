{ ... }:

{
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "text/html" = "librewolf.desktop";

      "application/pdf" = "librewolf.desktop";

      "x-scheme-handler/http" = "librewolf.desktop";
      "x-scheme-handler/https" = "librewolf.desktop";
      "x-scheme-handler/about" = "librewolf.desktop";
      "x-scheme-handler/unknown" = "librewolf.desktop";

      "x-scheme-handler/mailto" = "thunderbird.desktop";
    };
  };
}
