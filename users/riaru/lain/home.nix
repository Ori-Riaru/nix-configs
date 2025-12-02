{
  imports = [
    ../../../configs/system/home-global
    ../../../configs/programs/sops-home.nix
    ../../../configs/system/folders.nix

    # System
    ../../../configs/groups/niri-desktop.nix
    #// ../../../configs/groups/hyprland-desktop.nix
    #// ../../../configs/programs/kde/kde.nix
    ../../../configs/programs/ghostty.nix
    ../../../configs/programs/gparted.nix
    ../../../configs/programs/btop.nix
    ../../../configs/programs/openrgb/openrgb.nix

    # CLI
    ../../../configs/groups/cli-base.nix
    ../../../configs/programs/screen-savers.nix
    ../../../configs/programs/gemini-cli.nix

    # Tools
    ../../../configs/programs/firefox/firefox.nix
    ../../../configs/programs/chromium.nix

    ../../../configs/programs/obsidian.nix
    ../../../configs/programs/libre-office.nix
    ../../../configs/programs/boxes.nix

    ../../../configs/programs/obs-studio.nix
    ../../../configs/programs/shotcut.nix

    ../../../configs/programs/gimp.nix
    ../../../configs/programs/krita.nix
    ../../../configs/programs/inkscape.nix

    ../../../configs/programs/blender.nix
    ../../../configs/programs/f3d.nix
    ../../../configs/programs/godot.nix
    ../../../configs/programs/cura.nix

    # Gaming
    ../../../configs/programs/heroic.nix
    ../../../configs/programs/prism-launcher.nix
    ../../../configs/programs/mangohud.nix
    ../../../configs/programs/shadps4.nix

    # Development
    ../../../configs/programs/nix.nix
    ../../../configs/programs/git.nix
    ../../../configs/programs/vscodium/vscodium.nix
    ../../../configs/programs/cpp.nix
    ../../../configs/programs/act.nix

    # Communication
    ../../../configs/programs/discord.nix
    ../../../configs/programs/signal.nix
    ../../../configs/programs/slack.nix

    # Media
    ../../../configs/programs/spotify/spotify.nix
    ../../../configs/programs/jellyfin-media-player.nix

    ../../../configs/programs/file-viewers.nix
    ../../../configs/programs/fonts.nix
    ../../../configs/programs/mouse.nix
    ../../../configs/programs/nvtop.nix

    ../../../configs/programs/stylix.nix
    ../../../configs/system/default-apps.nix
  ];

  home.stateVersion = "24.05";
}
