{pkgs, ...}: {
  home.packages = with pkgs; [
    valent
  ];
}
