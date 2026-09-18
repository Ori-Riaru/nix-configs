{
  programs.walker.config.providers.actions."menus:projects" = [
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

  programs.elephant.provider.menus.lua.projects = ''
    Name = "projects"
    NamePretty = "Projects"
    Icon = "folder"
    Placeholder = "Search Projects..."
    Match = "Fuzzy"
    Cache = true

    function GetEntries()
        local base = "/mnt/nfs/riaru/Projects"
        local handle = io.popen("find '" .. base .. "' -mindepth 1 -maxdepth 1 -type d 2>/dev/null | sort")
        if not handle then
            return {}
        end
        local entries = {}
        for line in handle:lines() do
            local name = line:match("([^/]+)$")
            if name and name:sub(1, 1) ~= "." and not name:match("^z%-") then
                local path = line
                table.insert(entries, {
                    Text = name,
                    Subtext = "Project",
                    Icon = "folder",
                    Keywords = { "project", "open", name:lower() },
                    Actions = {
                        open = "codium '" .. path .. "'",
                        open_terminal = "ghostty --working-directory='" .. path .. "'",
                        open_files = "nautilus '" .. path .. "'",
                    },
                })
            end
        end
        handle:close()
        return entries
    end
  '';
}