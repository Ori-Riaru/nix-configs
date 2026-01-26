{
  pkgs,
  settings,
  ...
}: {
  home.packages = with pkgs; [
    starship
  ];

  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      palette = "neutral_dark";
      palettes.neutral_dark = {
        text = "${settings.text}";
        subtext = "${settings.subtext}";
        background = "${settings.card}";
        red = "${settings.red}";
        orange = "${settings.orange}";
        yellow = "${settings.yellow}";
        green = "${settings.teal}";
        cyan = "${settings.cyan}";
        blue = "${settings.blue}";
        purple = "${settings.purple}";
      };

      format = ''
        $character$cmd_duration$directory$fill$c$rust$nix_shell$golang$nodejs$php$java$kotlin$haskell$python$git_branch$git_status$username$hostname$line_break 󰜴 '';

      add_newline = false;

      character = {
        disabled = false;
        format = "$symbol";

        success_symbol = "[](fg:green)[](bold bg:green)[](fg:green) ";
        error_symbol = "[](fg:red)[](bold bg:red)[](fg:red) ";
      };

      cmd_duration = {
        format = "[](fg:orange)[$duration](bg:orange)[](fg:orange) ";
      };

      directory = {
        substitutions = {
          "~" = "󰉋";
          "Projects" = "";
          "nix-configs" = "";
          ".config" = "";
          "Documents" = "󰈙 ";
          "Downloads" = " ";
          "Music" = "󰝚 ";
          "Captures" = " ";
          "Games" = "";
          "Notes" = ""; # Changed to sticky note icon
          "Temp" = ""; # Stopwatch/timer for temporary
          "Backups" = ""; # Hard drive icon for backups
          "Trash" = "";
        };

        format = "[](fg:background)[$path](fg:text bg:background)[](fg:background) ";
        truncation_length = 10;
        truncation_symbol = "…/";
      };

      fill = {
        symbol = " ";
      };

      git_branch = {
        symbol = "";
        style = "bg:cyan";
        format = "[](fg:cyan)[[ $symbol $branch ](fg:text bg:cyan)]($style)";
      };

      git_status = {
        style = "bg:cyan";
        format = "[[($all_status$ahead_behind )](fg:text bg:cyan)]($style)[](fg:cyan) ";
      };

      nodejs = {
        symbol = "";
        style = "bg:blue";
        format = "[](fg:green)[[$symbol( $version)](fg:text bg:green)]($style)[](fg:green) ";
      };

      c = {
        symbol = " ";
        style = "bg:blue";
        format = "[](fg:blue)[[$symbol( $version)](fg:text bg:blue)]($style)[](fg:blue) ";
      };

      rust = {
        symbol = "";
        style = "bg:orange";
        format = "[](fg:orange)[[$symbol( $version)](fg:text bg:orange)]($style)[](fg:orange) ";
      };

      nix_shell = {
        symbol = "";
        style = "bg:blue";
        format = "[](fg:blue)[[$symbol( $version)](fg:text bg:blue)]($style)[](fg:blue) ";
      };

      golang = {
        symbol = "";
        style = "bg:blue";
        format = "[](fg:blue)[[$symbol( $version)](fg:text bg:blue)]($style)[](fg:blue) ";
      };

      php = {
        symbol = "";
        style = "bg:blue";
        format = "[](fg:purple)[[$symbol( $version)](fg:text bg:blue)]($style)[](fg:purple) ";
      };

      java = {
        symbol = " ";
        style = "bg:blue";
        format = "[](fg:red)[[$symbol( $version)](fg:text bg:red)]($style)[](fg:red) ";
      };

      kotlin = {
        symbol = "";
        style = "bg:blue";
        format = "[](fg:purple)[[ $symbol( $version) ](fg:text bg:purple)]($style)[](fg:purple) ";
      };

      haskell = {
        symbol = "";
        style = "bg:purple";
        format = "[](fg:purple)[[ $symbol( $version) ](fg:text bg:purple)]($style)[](fg:purple) ";
      };

      python = {
        symbol = "";
        style = "bg:yellow";
        format = "[](fg:yellow)[[ $symbol($version) ](fg:text bg:yellow)]($style)[](fg:yellow) ";
      };

      docker_context = {
        symbol = "";
        style = "bg:bg3";
        format = "[](fg:blue)[[ $symbol( $context) ](fg:text bg:blue)]($style)[](fg:blue) ";
      };

      username = {
        show_always = true;
        style_user = "bg:purple fg:text";
        style_root = "bg:purple fg:text";
        format = "[](fg:purple)[ $user ]($style)[](fg:purple)";
      };

      hostname = {
        ssh_only = true;
        style = "bg:purple fg:text";
        format = " [](fg:purple)[ @$hostname ]($style)[](fg:purple) ";
      };

      line_break = {
        disabled = false;
      };
    };
  };
}
