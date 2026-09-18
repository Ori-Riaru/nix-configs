{
  programs.elephant.provider.menus.toml = {
    rebuild = {
      name = "rebuild";
      name_pretty = "Rebuild";
      icon = "nix-snowflake";
      entries = [
        {
          text = "Rebuild Switch";
          keywords = ["rebuild" "switch" "system" "nh"];
          icon = "nix-snowflake";
          actions = {
            "switch" = "ghostty -e sh -c 'nh os switch && echo \"Press Enter to close\" && read'";
          };
        }
        {
          text = "Rebuild Boot";
          keywords = ["rebuild" "boot" "bootloader"];
          icon = "nix-snowflake";
          actions = {
            "boot" = "ghostty -e sh -c 'nh os boot && echo \"Press Enter to close\" && read'";
          };
        }
        {
          text = "Update";
          keywords = ["update" "inputs" "flake" "lock"];
          icon = "network-transmit-receive";
          submenu = "rebuildUpdate";
        }
        {
          text = "Rollback";
          keywords = ["rollback" "revert" "previous"];
          icon = "edit-undo";
          submenu = "rebuildRollback";
        }
        {
          text = "Inspect";
          keywords = ["inspect" "build" "history" "generations"];
          icon = "system-search";
          submenu = "rebuildInspect";
        }
        {
          text = "Garbage Collect";
          keywords = ["gc" "garbage" "collect" "clean" "purge"];
          icon = "user-trash";
          submenu = "rebuildGC";
        }
      ];
    };

    rebuildUpdate = {
      name = "rebuildUpdate";
      name_pretty = "Update Inputs";
      parent = "rebuild";
      hide_from_providerlist = true;
      icon = "network-transmit-receive";
      entries = [
        {
          text = "Update & Rebuild";
          keywords = ["update" "rebuild" "switch" "all"];
          icon = "nix-snowflake";
          actions = {
            "update" = "ghostty -e sh -c 'nh os switch -u && echo \"Press Enter to close\" && read'";
          };
        }
        {
          text = "Update & Build";
          keywords = ["update" "build" "all"];
          icon = "nix-snowflake";
          actions = {
            "update" = "ghostty -e sh -c 'nh os build -u && echo \"Press Enter to close\" && read'";
          };
        }
        {
          text = "Update Lock File";
          keywords = ["update" "lock" "flake" "inputs"];
          icon = "network-transmit-receive";
          actions = {
            "update" = "ghostty -e sh -c 'nix flake update --flake \"$NH_FLAKE\" && echo \"Press Enter to close\" && read'";
          };
        }
      ];
    };

    rebuildRollback = {
      name = "rebuildRollback";
      name_pretty = "Rollback";
      parent = "rebuild";
      hide_from_providerlist = true;
      icon = "edit-undo";
      entries = [
        {
          text = "Rollback to Previous";
          keywords = ["rollback" "previous" "revert"];
          icon = "edit-undo";
          actions = {
            "rollback" = "ghostty -e sh -c 'nh os rollback && echo \"Press Enter to close\" && read'";
          };
        }
        {
          text = "Rollback with Diff";
          keywords = ["rollback" "diff" "preview" "changes"];
          icon = "view-close";
          actions = {
            "rollback" = "ghostty -e sh -c 'nh os rollback --diff && echo \"Press Enter to close\" && read'";
          };
        }
      ];
    };

    rebuildInspect = {
      name = "rebuildInspect";
      name_pretty = "Inspect";
      parent = "rebuild";
      hide_from_providerlist = true;
      icon = "system-search";
      entries = [
        {
          text = "Build Only";
          keywords = ["build" "dry" "plan"];
          icon = "nix-snowflake";
          actions = {
            "inspect" = "ghostty -e sh -c 'nh os build && echo \"Press Enter to close\" && read'";
          };
        }
        {
          text = "Show History";
          keywords = ["history" "generations" "list" "log"];
          icon = "view-list-details";
          actions = {
            "inspect" = "ghostty -e sh -c 'nh os info && echo \"Press Enter to close\" && read'";
          };
        }
      ];
    };

    rebuildGC = {
      name = "rebuildGC";
      name_pretty = "Garbage Collect";
      parent = "rebuild";
      hide_from_providerlist = true;
      icon = "user-trash";
      entries = [
        {
          text = "Clean System";
          keywords = ["gc" "clean" "system" "garbage"];
          icon = "user-trash";
          actions = {
            "collect" = "ghostty -e sh -c 'nh clean system && echo \"Press Enter to close\" && read'";
          };
        }
        {
          text = "Clean User";
          keywords = ["gc" "clean" "user" "home"];
          icon = "user-trash";
          actions = {
            "collect" = "ghostty -e sh -c 'nh clean user && echo \"Press Enter to close\" && read'";
          };
        }
        {
          text = "Clean All";
          keywords = ["gc" "clean" "all" "garbage"];
          icon = "user-trash";
          actions = {
            "collect" = "ghostty -e sh -c 'nh clean all && echo \"Press Enter to close\" && read'";
          };
        }
        {
          text = "Clean Keep 7d";
          keywords = ["gc" "clean" "keep" "retention"];
          icon = "user-trash";
          actions = {
            "collect" = "ghostty -e sh -c 'nh clean all --keep-since 7d --keep 3 && echo \"Press Enter to close\" && read'";
          };
        }
      ];
    };
  };
}