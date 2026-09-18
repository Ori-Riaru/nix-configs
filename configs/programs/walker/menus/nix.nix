{
  pkgs,
  settings,
  ...
}: let
  mkActionBind = label: [
    {
      inherit label;
      action = "open";
      bind = "Return";
    }
  ];

  openBinds = [
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
    {
      action = "open_files";
      label = "Open Files";
      bind = "ctrl Return";
    }
  ];

  # Leaf entry: creates a template file directly (no prompts) and opens the
  # containing folder in vscodium.
  mkEntry = {
    category,
    target,
    template,
    text,
    subtext,
    icon ? "document-new",
    keywords ? [],
  }: {
    inherit text subtext icon;
    keywords = ["nix" "add" "create" category target] ++ keywords;
    actions = {
      open = "nix-add-config ${category} ${target} --template ${template}";
    };
  };

  mkCategoryMenu = {
    name,
    name_pretty,
    icon,
    entries,
  }: {
    inherit name name_pretty icon entries;
    parent = "add";
    hide_from_providerlist = true;
  };
in {
  home.packages = [
    (pkgs.writeShellScriptBin "nix-add-config" (builtins.readFile ./nix-add-config.sh))
    (pkgs.writeShellScriptBin "nix-pkg-search" (builtins.readFile ./nix-pkg-search.sh))
  ];

  programs.elephant.provider.menus.toml = {
    nix = {
      name = "add";
      name_pretty = "Add Program";
      description = "Create a nix program template";
      icon = "nix-snowflake";
      fixed_order = true;
      entries = [
        {
          text = "Programs";
          subtext = "New configs/programs/*.nix template";
          icon = "text-x-generic";
          keywords = ["nix" "program" "add" "config"];
          submenu = "nixPrograms";
        }
        {
          text = "Services";
          subtext = "New configs/services/*.nix template";
          icon = "system-run";
          keywords = ["nix" "service" "add" "config" "daemon"];
          submenu = "nixServices";
        }
        {
          text = "Groups";
          subtext = "New configs/groups/*.nix template";
          icon = "folder-symbolic";
          keywords = ["nix" "group" "add" "config"];
          submenu = "nixGroups";
        }
        {
          text = "System Configs";
          subtext = "New configs/system/*.nix template";
          icon = "computer";
          keywords = ["nix" "system" "add" "config"];
          submenu = "nixSystems";
        }
        {
          text = "Browse Configs";
          subtext = "Open existing config files";
          icon = "text-x-generic";
          keywords = ["nix" "config" "open" "browse" "files"];
          submenu = "nixFiles";
        }
        {
          text = "Package Lookup";
          subtext = "Search mynixos.com for package / option";
          icon = "system-search";
          keywords = ["nix" "search" "package" "option" "mynixos" "lookup"];
          actions = {
            open = "nix-pkg-search";
          };
        }
      ];
    };

    nixPrograms = mkCategoryMenu {
      name = "nixPrograms";
      name_pretty = "Programs";
      icon = "text-x-generic";
      entries = [
        (mkEntry {
          category = "program";
          target = "home";
          template = "package";
          text = "Package (Home)";
          subtext = "home.packages install";
          keywords = ["package" "install" "home-manager" "user"];
        })
        (mkEntry {
          category = "program";
          target = "system";
          template = "package";
          text = "Package (System)";
          subtext = "environment.systemPackages";
          keywords = ["package" "install" "system"];
        })
        (mkEntry {
          category = "program";
          target = "home";
          template = "module";
          text = "Module (Home)";
          subtext = "programs.NAME.enable (Home-Manager)";
          keywords = ["module" "enable" "home-manager"];
        })
        (mkEntry {
          category = "program";
          target = "system";
          template = "module";
          text = "Module (System)";
          subtext = "programs.NAME.enable (NixOS)";
          keywords = ["module" "enable" "system"];
        })
        (mkEntry {
          category = "program";
          target = "home";
          template = "manual";
          text = "Manual (Home)";
          subtext = "Bare header to fill in";
          keywords = ["manual" "blank"];
        })
        (mkEntry {
          category = "program";
          target = "system";
          template = "manual";
          text = "Manual (System)";
          subtext = "Bare header to fill in";
          keywords = ["manual" "blank"];
        })
      ];
    };

    nixServices = mkCategoryMenu {
      name = "nixServices";
      name_pretty = "Services";
      icon = "system-run";
      entries = [
        (mkEntry {
          category = "service";
          target = "home";
          template = "module";
          text = "Module (Home)";
          subtext = "services.NAME.enable (Home-Manager)";
          keywords = ["module" "enable" "home-manager"];
        })
        (mkEntry {
          category = "service";
          target = "system";
          template = "module";
          text = "Module (System)";
          subtext = "services.NAME.enable (NixOS)";
          keywords = ["module" "enable" "system"];
        })
        (mkEntry {
          category = "service";
          target = "home";
          template = "daemon";
          text = "Daemon (Home)";
          subtext = "systemd user unit";
          keywords = ["daemon" "systemd" "unit" "user"];
        })
        (mkEntry {
          category = "service";
          target = "system";
          template = "daemon";
          text = "Daemon (System)";
          subtext = "systemd system unit";
          keywords = ["daemon" "systemd" "unit" "system"];
        })
        (mkEntry {
          category = "service";
          target = "home";
          template = "manual";
          text = "Manual (Home)";
          subtext = "Bare header to fill in";
          keywords = ["manual" "blank"];
        })
        (mkEntry {
          category = "service";
          target = "system";
          template = "manual";
          text = "Manual (System)";
          subtext = "Bare header to fill in";
          keywords = ["manual" "blank"];
        })
      ];
    };

    nixGroups = mkCategoryMenu {
      name = "nixGroups";
      name_pretty = "Groups";
      icon = "folder-symbolic";
      entries = [
        (mkEntry {
          category = "group";
          target = "home";
          template = "package";
          text = "Group (Home)";
          subtext = "home.packages collection";
          keywords = ["group" "collection" "packages"];
        })
        (mkEntry {
          category = "group";
          target = "system";
          template = "package";
          text = "Group (System)";
          subtext = "environment.systemPackages collection";
          keywords = ["group" "collection" "packages"];
        })
        (mkEntry {
          category = "group";
          target = "home";
          template = "manual";
          text = "Manual (Home)";
          subtext = "Bare header to fill in";
          keywords = ["manual" "blank"];
        })
        (mkEntry {
          category = "group";
          target = "system";
          template = "manual";
          text = "Manual (System)";
          subtext = "Bare header to fill in";
          keywords = ["manual" "blank"];
        })
      ];
    };

    nixSystems = mkCategoryMenu {
      name = "nixSystems";
      name_pretty = "System Configs";
      icon = "computer";
      entries = [
        (mkEntry {
          category = "system";
          target = "home";
          template = "manual";
          text = "System Config";
          subtext = "Bare configs/system/*.nix header";
          keywords = ["system" "manual" "blank" "header"];
        })
      ];
    };
  };

  programs.elephant.provider.menus.lua.nixFiles = ''
    Name = "nixFiles"
    NamePretty = "Browse Configs"
    Icon = "text-x-generic"
    Placeholder = "Search config files..."
    Match = "Fuzzy"
    Cache = false
    HideFromProviderlist = true

    local base = "${settings.configPath}/configs"
    local escaped = base:gsub("(%W)", "%%%1")

    function GetEntries()
        local roots = { "programs", "services", "groups", "system" }
        local entries = {}
        for _, root in ipairs(roots) do
            local handle = io.popen("find '" .. base .. "/" .. root .. "' -name '*.nix' 2>/dev/null | sort")
            if handle then
                for line in handle:lines() do
                    local rel = line:gsub("^" .. escaped .. "/", "")
                    local label = rel:gsub("%.nix$", "")
                    local dir = line:gsub("/[^/]*$", "")
                    local icon = "text-x-generic"
                    if root == "services" then icon = "system-run" end
                    if root == "groups" then icon = "folder-symbolic" end
                    if root == "system" then icon = "computer" end
                    table.insert(entries, {
                        Text = label,
                        Subtext = "configs/" .. rel,
                        Icon = icon,
                        Keywords = { "config", "nix", "open", root, label:lower() },
                        Actions = {
                            open = "codium '" .. line .. "'",
                            open_terminal = "ghostty --working-directory='" .. dir .. "'",
                            open_files = "nautilus '" .. dir .. "'",
                        },
                    })
                end
                handle:close()
            end
        end
        return entries
    end
  '';

  programs.walker.config.providers.actions = {
    "menus:add" = mkActionBind "Open";
    "menus:nixPrograms" = mkActionBind "Add";
    "menus:nixServices" = mkActionBind "Add";
    "menus:nixGroups" = mkActionBind "Add";
    "menus:nixSystems" = mkActionBind "Add";
    "menus:nixFiles" = openBinds;
  };
}