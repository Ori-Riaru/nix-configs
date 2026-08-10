{pkgs, ...}: {
  home.packages = [
    (pkgs.obs-studio.override { cudaSupport = true; })
  ];
}
