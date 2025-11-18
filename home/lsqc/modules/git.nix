{ ... }:

{
  programs.git = {
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
}
