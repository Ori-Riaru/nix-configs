{pkgs, ...}: {
  home.packages = with pkgs; [
    pgmodeler
    pgadmin4
    postgresql
  ];

}
