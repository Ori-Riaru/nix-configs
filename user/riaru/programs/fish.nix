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
      ga = "git add .";
      gc = "git commit -m";

      nrs = "sudo nixos-rebuild switch --flake ~/Projects/nix-configs/#shizuku";

      code = "codium";
      configs = "codium ~/Projects/nix-configs";
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
