{
  programs.walker.config.providers.actions."menus:folders" = [
    {
      action = "open";
      label = "Open";
      bind = "Return";
    }
    {
      action = "open_terminal";
      label = "Open Terminal";
      bind = "shift Return";
    }
  ];

  programs.elephant.provider.menus.toml.folders = {
    name = "folders";
    name_pretty = "Folders";
    icon = "";
    entries = [
      {
        text = "Home";
        icon = "";
        actions = {
          "open" = "nautilus /mnt/nfs/riaru";
          "open_terminal" = "ghostty --working-directory='/mnt/nfs/riaru'";
        };
      }
      {
        text = "Home Local";
        icon = "";
        actions = {
          "open" = "nautilus ~/";
          "open_terminal" = "ghostty --working-directory='/home/riaru'";
        };
      }
      {
        text = "Bulk";
        icon = "";
        actions = {
          "open" = "nautilus /mnt/nfs/bulk";
          "open_terminal" = "ghostty --working-directory='/mnt/nfs/bulk'";
        };
      }
      {
        text = "Config";
        icon = "";
        actions = {
          "open" = "nautilus ~/.config";
          "open_terminal" = "ghostty --working-directory='/home/riaru/.config'";
        };
      }
      {
        text = "Nix Config";
        keywords = ["nix-config"];
        icon = "";
        actions = {
          "open" = "nautilus /mnt/nfs/riaru/Projects/nix-configs";
          "open_terminal" = "ghostty --working-directory='/mnt/nfs/riaru/Projects/nix-configs'";
        };
      }
      {
        text = "Projects";
        icon = "";
        actions = {
          "open" = "nautilus /mnt/nfs/riaru/Projects";
          "open_terminal" = "ghostty --working-directory='/mnt/nfs/riaru/Projects'";
        };
      }
      {
        text = "Captures";
        icon = "";
        actions = {
          "open" = "nautilus /mnt/nfs/riaru/Captures";
          "open_terminal" = "ghostty --working-directory='/mnt/nfs/riaru/Captures'";
        };
      }
      {
        text = "Documents";
        icon = "󰈙";
        actions = {
          "open" = "nautilus /mnt/nfs/riaru/Documents";
          "open_terminal" = "ghostty --working-directory='/mnt/nfs/riaru/Documents'";
        };
      }
      {
        text = "Downloads";
        icon = "󰉍";
        actions = {
          "open" = "nautilus ~/Downloads";
          "open_terminal" = "ghostty --working-directory='/home/riaru/Downloads'";
        };
      }
      {
        text = "Games Local";
        icon = "";
        actions = {
          "open" = "nautilus ~/Games";
          "open_terminal" = "ghostty --working-directory='/home/riaru/Games'";
        };
      }
      {
        text = "Games Nas";
        icon = "";
        actions = {
          "open" = "nautilus /mnt/nfs/bulk/Games";
          "open_terminal" = "ghostty --working-directory='/mnt/nfs/bulk/Games'";
        };
      }
      {
        text = "Installs Local";
        icon = "󱊞";
        actions = {
          "open" = "nautilus ~/Games/Installs";
          "open_terminal" = "ghostty --working-directory='/home/riaru/Games/Installs'";
        };
      }
      {
        text = "Prefix Local";
        icon = "";
        actions = {
          "open" = "nautilus ~/Games/Prefixes";
          "open_terminal" = "ghostty --working-directory='/home/riaru/Games/Prefixes'";
        };
      }
      {
        text = "Installs NAS";
        icon = "󱊞";
        actions = {
          "open" = "nautilus /mnt/nfs/bulk/Games/Installs";
          "open_terminal" = "ghostty --working-directory='/mnt/nfs/bulk/Games/Installs'";
        };
      }
      {
        text = "Prefix NAS";
        icon = "";
        actions = {
          "open" = "nautilus /mnt/nfs/riaru/Games/Prefixes";
          "open_terminal" = "ghostty --working-directory='/mnt/nfs/riaru/Games/Prefixes'";
        };
      }
      {
        text = "Archive";
        icon = "";
        actions = {
          "open" = "nautilus /mnt/nfs/riaru/Projects/z-archive";
          "open_terminal" = "ghostty --working-directory='/mnt/nfs/riaru/Projects/z-archive'";
        };
      }
      {
        text = "Backups";
        icon = "";
        actions = {
          "open" = "nautilus /mnt/nfs/bulk/Backups";
          "open_terminal" = "ghostty --working-directory='/mnt/nfs/bulk/Backups'";
        };
      }
      {
        text = "Movies";
        icon = "";
        actions = {
          "open" = "nautilus /mnt/nfs/bulk/Movies";
          "open_terminal" = "ghostty --working-directory='/mnt/nfs/bulk/Movies'";
        };
      }
      {
        text = "Books";
        icon = "";
        actions = {
          "open" = "nautilus /mnt/nfs/bulk/Books";
          "open_terminal" = "ghostty --working-directory='/mnt/nfs/bulk/Books'";
        };
      }
      {
        text = "Shows";
        icon = "";
        actions = {
          "open" = "nautilus /mnt/nfs/bulk/Shows";
          "open_terminal" = "ghostty --working-directory='/mnt/nfs/bulk/Shows'";
        };
      }
      {
        text = "Music";
        icon = "";
        actions = {
          "open" = "nautilus /mnt/nfs/riaru/Music";
          "open_terminal" = "ghostty --working-directory='/mnt/nfs/riaru/Music'";
        };
      }
    ];
  };
}