{pkgs, ...}: {
  imports = [
  ];

  home.packages = with pkgs; [
    bottles
    lutris
    heroic

    mangohud

    # Emulators
    ryujinx
  ];
  
  programs.mangohud.enable = true;
  # stylix.targets.mangohud.enable = true;
}
