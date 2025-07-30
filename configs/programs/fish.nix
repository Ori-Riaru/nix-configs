{settings, ...}: {
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
      bd = "cd $OLDPWD";
      hm = "cd ~";
      l = "lsd";
      ls = "lsd";
      c = "clear";
      search = "fzf -q";
      s = "fzf -q";

      cp = "cp -i";
      mv = "mv -i";
      rm = "trash -v";

      ping = "ping -c 10";

      g = "git";
      ga = "git add";
      gs = "git status";
      gc = "git commit -m";
      gac = "git add . && git commit -m";
      gp = "git push";
      gl = "git pull";

      home = "nh home switch";
      os = "nh os switch";
      update = "nix flake update --flake ${settings.configPath}";
      ns = "nix-shell";
      nsp = "nix-shell -p";

      code = "codium";
      configs = "codium ${settings.configPath}";
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

      init = {
        body = ''
          nix flake init --template ${settings.configPath}/#$argv[1]
        '';
      };
    };
  };
}
