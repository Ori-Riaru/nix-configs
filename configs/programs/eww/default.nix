{pkgs, ...}: {
  home.packages = with pkgs; [
    eww
    python3
    python3Packages.dbus-python
    python3Packages.pygobject3
  ];

  # Copy entire eww config directory
  home.file.".config/eww" = {
    source = ./.;
    recursive = true;
  };
}
