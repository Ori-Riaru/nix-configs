{pkgs, ...}: {
  home.packages = with pkgs; [
    nautilus
    # nautilus-hide
    code-nautilus
    p7zip
    unrar
  ];

  xdg.desktopEntries."org.gnome.Nautilus" = {
    name = "Files";
    comment = "Access and organize files";
    icon = "org.gnome.Nautilus";
    exec = "nautilus --new-window /mnt/nfs/riaru";
    terminal = false;
    type = "Application";
    startupNotify = true;
    categories = ["GNOME" "GTK" "Utility" "Core" "FileManager"];
    mimeType = [
      "inode/directory"
      "application/x-gnome-saved-search"
      "application/x-7z-compressed"
      "application/x-7z-compressed-tar"
      "application/x-bzip"
      "application/x-bzip-compressed-tar"
      "application/x-compress"
      "application/x-compressed-tar"
      "application/x-cpio"
      "application/x-gzip"
      "application/x-lha"
      "application/x-lzip"
      "application/x-lzip-compressed-tar"
      "application/x-lzma"
      "application/x-lzma-compressed-tar"
      "application/x-tar"
      "application/x-tarz"
      "application/x-xar"
      "application/x-xz"
      "application/x-xz-compressed-tar"
      "application/zip"
      "application/gzip"
      "application/bzip2"
      "application/x-bzip2-compressed-tar"
      "application/vnd.rar"
      "application/zstd"
      "application/x-zstd-compressed-tar"
    ];
    settings = {
      DBusActivatable = "true";
      X-GNOME-UsesNotifications = "true";
      X-Unity-IconBackgroundColor = "#af4853";
      X-Purism-FormFactor = "Workstation;Mobile;";
      Keywords = "folder;manager;explore;disk;filesystem;nautilus;";
    };
    actions = {
      new-window = {
        name = "New Window";
        exec = "nautilus --new-window /mnt/nfs/riaru";
      };
    };
  };

  # enable expand folders in list view
  home.file.".config/nautilus/preferences".text = ''
    [ListView]
    expand_folders=true
  '';
}
