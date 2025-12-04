{ ... }:

{
  programs.git = {
    enable = true;

    signing = {
      format = "ssh";
      signByDefault = true;

      key = "~/.ssh/gitkey";
    };

    settings = {
      user = {
        email = "lsqc@nya.vodka";
        name = "lsqc";
      };
      alias = {
        st = "status";
        c = "commit";
        me = "merge";
        cp = "cherry-pick";
        b = "branch";
        co = "checkout";
      };
      init = { defaultBranch = "main"; };
    };

    # extraConfig = { init = { defaultBranch = "main"; }; };
  };
}
