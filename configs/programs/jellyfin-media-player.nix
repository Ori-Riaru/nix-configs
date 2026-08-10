{pkgs, ...}: {
  home.packages = with pkgs.stable; [
    # jellyfin-media-player
  ];
}
