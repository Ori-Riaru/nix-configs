{pkgs, ...}: {
  home.packages = with pkgs; [
    caffeine
  ];
}
