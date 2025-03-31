{
  programs.fish = {
    enable = true;

    shellInit = ''
      auto_newline
      clear
      starship init fish | source
    '';

    shellAliases = {
      ".." = "cd ..";
      "..." = "cd ../..";
      "...." = "cd ../../..";
      l = "lsd";
      ls = "lsd";
      c = "clear";
      search = "fzf -q";
      s = "fzf -q";

      g = "git";
      ga = "git add";
      gs = "git status";
      gc = "git commit -m";
      gca = "git add . && git commit -m";
      gp = "git push";
      gl = "git pull";

      code = "codium";
      configs = "codium ~/Projects/nix-configs";
      clipboard = "xclip -selection clipboard";
      clip = "xclip -selection clipboard";
    };

    functions = {
      fish_greeting = "";

      auto_newline = {
        body = ''
          if test "$argv[1]" != "clear" -a "$argv[1]" != "c"
              echo
          end
        '';
        onEvent = "fish_postexec";
      };
    };
  };
}
