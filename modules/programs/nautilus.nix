{pkgs, ...}: {
  home.packages = with pkgs; [
    nautilus
    p7zip
  ];
}
