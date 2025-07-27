{pkgs, ...}: {
  home.packages = with pkgs; [
    # Logitech mouse configurator
    piper
    libratbag
  ];
}
