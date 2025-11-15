{pkgs, ...}: {
  home.packages = with pkgs; [
    pgmodeler
    postgresql
  ];
}
