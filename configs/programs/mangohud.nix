{pkgs, ...}: {
  home.packages = [
    (pkgs.mangohud.override { nvidiaSupport = true; })
  ];
}
