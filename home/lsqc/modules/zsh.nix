{ ... }:

{
  programs.zsh = {
    enable = true;
    autocd = true;

    autosuggestion.enable = true;

    syntaxHighlighting = {
      enable = true;
      styles = {
        command = "fg=#00d7af,bold";
        alias = "fg=#af87ff,bold,italic";
        path = "fg=#5fd7ff,italic";
        unknown-token = "fg=#ffffff,bold,bg=#ff0000";

        reserved-word = "fg=#ffff00,bold";
        builtin = "fg=#00d7af,bold";
        function = "fg=#00ff5f,bold";
        precommand = "fg=#00d7af,underline";
        hashed-command = "fg=#00d7af";
        suffix-alias = "fg=#af87ff,bold";
        global-alias = "fg=#af87ff,bold";
        autodirectory = "fg=#5fd7ff,bold";

        path_prefix = "fg=#5fd7ff";
        path_pathseparator = "fg=#585858";

        single-hyphen-option = "fg=#00ff5f,bold";
        double-hyphen-option = "fg=#00ff5f,bold";
        arg0 = "fg=#00d7af";

        single-quoted-argument = "fg=#00ff5f";
        double-quoted-argument = "fg=#00ff5f";
        dollar-single-quoted-argument = "fg=#00ffff,bold";
        dollar-double-quoted-argument = "fg=#00ffff,bold";
        back-quoted-argument = "fg=#af87ff";
        back-double-quoted-argument = "fg=#00ffff";
        back-dollar-quoted-argument = "fg=#00ffff";

        commandseparator = "fg=#ffff00";
        redirection = "fg=#ffff00,bold";
        named-fd = "fg=#af87ff";
        numeric-fd = "fg=#af87ff";

        globbing = "fg=#ffff00,bold";
        history-expansion = "fg=#af87ff,bold";
        assign = "none";
        comment = "fg=#585858,italic";
        default = "none";
      };
    };

    shellAliases = {
      ls = "ls -lsa --color";
      l = "ls -lsa --color";
      ll = "ls -l";
      la = "ls -a";

      zz = "EDITOR=hx yazi";
      ed = "hx";
      vi = "hx";
      vim = "hx";
      nvim = "hx";

      jj = "just";

      g = "git";
      cg = "cargo";
      cr = "cargo run";

      cat = "bat";
      pat = "bat -p";

      home = "home-manager";

      nef = "neofetch";
      cd = "z";
      psh = "nix-shell -p";

      traceroute = "mtr";
    };

    initContent = ''
      #      PROMPT="%F{147}%n%F{122}::%F{61}%m %F{255}∈ %F{69}%~%F{14}%f %F{166}λ %F{255}"
            PROMPT=" %B%F{47}%F{45}%~%f%F{57}> %F{162}λ %f"

            bindkey "^[[1;5C" forward-word
            bindkey "^[[1;5D" backward-word
            bindkey "^[[3~" delete-char
            bindkey "^[[3;5~" kill-word
            autoload -U select-word-style
            select-word-style bash
    '';
  };
}
