{pkgs, ...}: {
  home.packages = with pkgs; [
    # jetbrains.idea-community
    openjdk
    postgresql_jdbc
    maven
  ];
}
