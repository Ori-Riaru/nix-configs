{pkgs, ...}: {
  home.packages = with pkgs; [
    nautilus
    p7zip
    unrar
  ];

  # enable expand folders in list view
  home.file.".config/nautilus/preferences".text = ''
    [ListView]
    expand_folders=true
  '';

}
