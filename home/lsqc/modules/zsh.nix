{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;

    shellAliases = {

      ls = "ls -lsa --color";

      zi = "yazi";
      ed = "hx";
      vi = "hx";
      vim = "hx";
      nvim = "hx";

      g = "git";

    };

    initContent = ''
      PROMPT="%F{147}%n%F{122}::%F{61}%m %F{255}∈ %F{69}%~%F{14}%f %F{79}λ %F{255}"
    '';
  };
}
