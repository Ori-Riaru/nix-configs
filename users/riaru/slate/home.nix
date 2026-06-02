{
  imports = [
    ../../../configs/system/home-global
    ../../../configs/programs/sops-home.nix
    ../../../configs/system/folders.nix
    ../../../configs/groups/niri-desktop.nix

    # CLI
    ../../../configs/groups/cli-base.nix
    ../../../configs/programs/screen-savers.nix
    ../../../configs/programs/btop.nix

    # Tools
    ../../../configs/programs/stylelint.nix
    ../../../configs/programs/vivaldi/vivaldi.nix
    ../../../configs/programs/firefox/firefox.nix
    ../../../configs/programs/chromium.nix
    ../../../configs/programs/ghostty.nix
    ../../../configs/programs/obsidian.nix
    ../../../configs/programs/blender/blender.nix
    ../../../configs/programs/inkscape.nix
    ../../../configs/programs/libre-office.nix

    ../../../configs/programs/krita.nix
    ../../../configs/programs/cura.nix
    ../../../configs/programs/boxes.nix
    ../../../configs/programs/obs-studio.nix
    ../../../configs/programs/shotcut.nix
    ../../../configs/programs/gparted.nix
    ../../../configs/programs/godot.nix
    ../../../configs/programs/f3d.nix

    # Development

    ../../../configs/programs/nix.nix
    ../../../configs/programs/git.nix
    ../../../configs/programs/vscodium/vscodium.nix

    ../../../configs/programs/opencode/opencode.nix
    ../../../configs/programs/unityhub.nix

    # Communication
    ../../../configs/programs/discord.nix
    ../../../configs/programs/signal.nix
    ../../../configs/programs/kdeconnect/kdeconnect-home.nix

    # Medi
    ../../../configs/programs/heroic.nix

    # System
    ../../../configs/system/ssh-bypass.nix
    ../../../configs/programs/file-viewers.nix
    ../../../configs/system/fonts.nix
    ../../../configs/programs/mouse.nix
    ../../../configs/system/default-apps.nix
    ../../../configs/services/batsignal.nix

    ../../../configs/programs/stylix.nix
  ];

  home.stateVersion = "26.05";
}
