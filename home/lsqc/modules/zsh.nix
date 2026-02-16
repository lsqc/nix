{ ... }:

{
  programs.zsh = {
    enable = true;
    autocd = true;

    autosuggestion.enable = true;

    syntaxHighlighting = {
      enable = true;
      styles = {
        command = "fg=#3bff96";
        alias = "fg=#7e008a,bold";
        path = "fg=#0fdb6e,italic";
        unknown-token = "fg=#999999";
      };
    };

    shellAliases = {

      ls = "ls -lsa --color";
      ll = "ls -l";
      la = "ls -a";

      zi = "EDITOR=hx yazi";
      ed = "hx";
      vi = "hx";
      vim = "hx";
      nvim = "hx";

      jj = "just";

      g = "git";
      cg = "cargo";
      cr = "cargo run";

      cat = "bat";

      nef = "neofetch";
    };

    initContent = ''
      #      PROMPT="%F{147}%n%F{122}::%F{61}%m %F{255}∈ %F{69}%~%F{14}%f %F{166}λ %F{255}"
            PROMPT=" %B%F{47}%F{45}%~%f%F{57} λ %f"

            bindkey "^[[1;5C" forward-word
            bindkey "^[[1;5D" backward-word
            bindkey "^[[3~" delete-char

    '';
  };
}
