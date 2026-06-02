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
        foreground = "${settings.base}";
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
        $character$cmd_duration$directory$git_branch$git_status$fill$c$rust$nix_shell$golang$nodejs$php$java$kotlin$haskell$python$username$hostname$line_break 󰜴 '';

      add_newline = false;

      character = {
        disabled = false;
        format = "$symbol";

        success_symbol = "[](fg:green)[](bold fg:foreground bg:green)[](fg:green) ";
        error_symbol = "[](fg:red)[](bold fg:foreground bg:red)[]( fg:red) ";
      };

      cmd_duration = {
        format = "[](fg:orange)[$duration](fg:foreground bg:orange)[](fg:orange) ";
      };

      directory = {
        substitutions = {
          "~" = "󰉋";
          "/mnt/nfs/riaru" = "";
          "Projects" = "";
          "/mnt/nfs/riaru/Projects/nix-configs" = "";
          ".config" = "";
          "Documents" = "󰈙 ";
          "Downloads" = " ";
          "Music" = "󰝚 ";
          "Captures" = " ";
          "Games" = "";
          "Notes" = "";
          "Temp" = "";
          "Backups" = "";
          "Trash" = "";
        };

        format = "[](fg:background)[$path](fg:text bg:background)[](fg:background) ";
        truncation_length = 256;
        truncation_symbol = "…/";
      };

      fill = {
        symbol = " ";
      };

      git_branch = {
        symbol = "";
        style = "bg:card";
        format = "[](fg:background)[[$symbol $branch ](fg:text bg:card)]($style)";
      };

      git_status = {
        style = "bg:card";
        format = "[($all_status$ahead_behind)](fg:text bg:card)[](fg:background)";
      };

      nodejs = {
        symbol = "";
        style = "bg:blue";
        format = "[](fg:green)[[$symbol( $version)](fg:foreground bg:green)]($style)[](fg:green) ";
      };

      c = {
        symbol = " ";
        style = "bg:blue";
        format = "[](fg:blue)[[$symbol( $version)](fg:foreground bg:blue)]($style)[](fg:blue) ";
      };

      rust = {
        symbol = "";
        style = "bg:orange";
        format = "[](fg:orange)[[$symbol( $version)](fg:foreground bg:orange)]($style)[](fg:orange) ";
      };

      nix_shell = {
        symbol = "";
        style = "bg:blue";
        format = "[](fg:blue)[[$symbol( $version)](fg:foreground bg:blue)]($style)[](fg:blue) ";
      };

      golang = {
        symbol = "";
        style = "bg:blue";
        format = "[](fg:blue)[[$symbol( $version)](fg:foreground bg:blue)]($style)[](fg:blue) ";
      };

      php = {
        symbol = "";
        style = "bg:blue";
        format = "[](fg:purple)[[$symbol( $version)](fg:foreground bg:blue)]($style)[](fg:purple) ";
      };

      java = {
        symbol = "m ";
        style = "bg:blue";
        format = "[](fg:red)[[$symbol( $version)](fg:foreground bg:red)]($style)[](fg:red) ";
      };

      kotlin = {
        symbol = "";
        style = "bg:blue";
        format = "[](fg:purple)[[ $symbol( $version) ](fg:foreground bg:purple)]($style)[](fg:purple) ";
      };

      haskell = {
        symbol = "";
        style = "bg:purple";
        format = "[](fg:purple)[[ $symbol( $version) ](fg:foreground bg:purple)]($style)[](fg:purple) ";
      };

      python = {
        symbol = "";
        style = "bg:yellow";
        format = "[](fg:yellow)[[ $symbol($version) ](fg:foreground bg:yellow)]($style)[](fg:yellow) ";
      };

      docker_context = {
        symbol = "";
        style = "bg:bg3";
        format = "[](fg:blue)[[ $symbol( $context) ](fg:foreground bg:blue)]($style)[](fg:blue) ";
      };

      username = {
        show_always = false;
        style_user = "bg:purple fg:foreground";
        style_root = "bg:purple fg:foreground";
        format = "[](fg:purple)[ $user ]($style)[](fg:purple)";
      };

      hostname = {
        ssh_only = true;
        style = "bg:purple fg:foreground";
        format = " [](fg:purple)[ @$hostname ]($style)[](fg:purple) ";
      };

      line_break = {
        disabled = false;
      };
    };
  };
}
