{ ... }:

{
  programs.zsh = {
    enable = true;

    shellAliases = {

      ls = "ls -lsa --color";

      zi = "EDITOR=hx yazi";
      ed = "hx";
      vi = "hx";
      vim = "hx";
      nvim = "hx";

      g = "git";
      cg = "cargo";
      cr = "cargo run";

      cat = "bat";

      nef = "neofetch";
    };

    initContent = ''
      PROMPT="%F{147}%n%F{122}::%F{61}%m %F{255}∈ %F{69}%~%F{14}%f %F{166}λ %F{255}"

      bindkey "^[[1;5C" forward-word
      bindkey "^[[1;5D" backward-word

    '';
  };
}
