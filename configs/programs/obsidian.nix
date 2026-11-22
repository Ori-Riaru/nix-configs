{settings, ...}: {
  programs.obsidian = {
    enable = true;
    cli.enable = true;
  };

  xdg.desktopEntries."md.obsidian.Obsidian" = {
    name = "Obsidian";
    comment = "Knowledge base";
    icon = "obsidian";
    exec = "obsidian ${settings.nasPath}/Notes %u";
    terminal = false;
    type = "Application";
    mimeType = ["x-scheme-handler/obsidian"];
    categories = ["Office"];
    settings = {
      StartupWMClass = "md.obsidian.Obsidian";
      Version = "1.5";
    };
  };
}
