{
  imports = [
    ../../../modules/user-settings.nix
    ../../../configs/system/home-global

    ../../../configs/programs/sops-home.nix

    # Desktop
    ../../../configs/groups/niri-desktop.nix

    # System
    ../../../configs/system/folders.nix
    ../../../configs/system/ssh-bypass.nix
    ../../../configs/system/default-apps.nix
    ../../../configs/system/fonts.nix
    ../../../configs/programs/file-viewers.nix
    ../../../configs/programs/mouse.nix
    ../../../configs/programs/screen-savers.nix

    # Terminal & CLI
    ../../../configs/groups/cli-apps.nix
    ../../../configs/programs/ghostty.nix
    ../../../configs/programs/btop.nix

    # Browsers
    ../../../configs/programs/firefox/firefox.nix
    ../../../configs/programs/chromium.nix
    ../../../configs/programs/vivaldi/vivaldi.nix

    # Development
    ../../../configs/programs/git.nix
    ../../../configs/programs/vscodium/vscodium.nix
    ../../../configs/programs/nix.nix
    ../../../configs/programs/opencode/opencode.nix
    ../../../configs/programs/unityhub.nix
    ../../../configs/programs/stylelint.nix

    # Communication
    ../../../configs/programs/discord.nix
    ../../../configs/programs/signal.nix
    ../../../configs/programs/kdeconnect/kdeconnect-home.nix

    # Media & Creative
    ../../../configs/programs/obs-studio.nix
    ../../../configs/programs/shotcut.nix
    ../../../configs/programs/krita.nix
    ../../../configs/programs/blender/blender.nix
    ../../../configs/programs/inkscape.nix
    ../../../configs/programs/f3d.nix
    ../../../configs/programs/godot.nix

    # Gaming
    ../../../configs/programs/heroic.nix

    # Utilities
    ../../../configs/programs/obsidian.nix
    ../../../configs/programs/libre-office.nix
    ../../../configs/programs/boxes.nix
    ../../../configs/programs/gparted.nix

    # Styling
    ../../../configs/programs/stylix.nix

    # Services
    ../../../configs/services/batsignal.nix
  ];

  home.stateVersion = "26.05";
}
