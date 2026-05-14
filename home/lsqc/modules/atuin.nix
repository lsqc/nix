{ ... }:

{
  programs.atuin = {
    enable = true;

    flags = [ "--disable-up-arrow" ];

    enableZshIntegration = true;
    enableNushellIntegration = true;

    settings = { auto_sync = false; };
  };
}
