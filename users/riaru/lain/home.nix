{
  imports = [
    ../../../modules/user-settings.nix
    ../../../configs/system/home-global
    ../../../configs/programs/sops-home.nix # Make global

    # Desktop
    ../../../configs/groups/niri-desktop.nix

    # System
    ../../../configs/system/folders.nix
    ../../../configs/system/default-apps.nix
    ../../../configs/system/fonts.nix
    ../../../configs/programs/file-viewers.nix
    ../../../configs/programs/mouse.nix
    ../../../configs/programs/nvtop.nix
    ../../../configs/programs/screen-savers.nix

    # Utilities
    ../../../configs/programs/libre-office.nix
    ../../../configs/programs/boxes.nix
    ../../../configs/programs/baobab.nix
    ../../../configs/programs/gparted.nix
    ../../../configs/programs/mission-control.nix
    ../../../configs/programs/openrgb/openrgb.nix

    # Internet
    ../../../configs/programs/firefox/firefox.nix
    ../../../configs/programs/chromium.nix
    ../../../configs/programs/vivaldi/vivaldi.nix
    ../../../configs/programs/obsidian.nix

    # Development
    ../../../configs/programs/git.nix
    ../../../configs/programs/vscodium/vscodium.nix
    ../../../configs/programs/nix.nix
    ../../../configs/programs/opencode/opencode.nix
    ../../../configs/programs/act.nix
    ../../../configs/programs/unityhub.nix
    ../../../configs/programs/stylelint.nix

    # Terminal & CLI
    ../../../configs/groups/cli-apps.nix
    ../../../configs/programs/ghostty.nix
    ../../../configs/programs/btop.nix

    # Communication
    ../../../configs/programs/discord.nix
    ../../../configs/programs/signal.nix
    ../../../configs/programs/cinny-desktop.nix
    ../../../configs/programs/kdeconnect/kdeconnect-home.nix
    ../../../configs/programs/easyeffects.nix

    # Media
    ../../../configs/programs/obs-studio.nix
    ../../../configs/programs/shotcut.nix
    ../../../configs/programs/gimp.nix
    ../../../configs/programs/krita.nix
    ../../../configs/programs/inkscape.nix
    ../../../configs/programs/blender/blender.nix
    ../../../configs/programs/f3d.nix
    ../../../configs/programs/godot.nix
    ../../../configs/programs/prusa-slicer.nix
    ../../../configs/programs/spotify/spotify.nix

    # Gaming
    ../../../configs/programs/heroic.nix
    ../../../configs/programs/prism-launcher.nix
    ../../../configs/programs/mangohud.nix
    ../../../configs/programs/shadps4.nix

    # Styling
    ../../../configs/programs/stylix.nix
  ];

  home.stateVersion = "26.05";
}
