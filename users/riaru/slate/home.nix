{...}: {
  imports = [
    ../../../configs/system/home-global
    ../../../configs/system/folders.nix

    ../../../configs/groups/niri-desktop.nix

    # CLI
    ../../../configs/groups/cli-base.nix
    ../../../configs/programs/ripgrep.nix
    ../../../configs/programs/screen-savers.nix
    ../../../configs/programs/btop.nix

    # Tools
    ../../../configs/programs/firefox/firefox.nix
    ../../../configs/programs/chromium.nix
    ../../../configs/programs/kitty.nix
    ../../../configs/programs/obsidian.nix
    ../../../configs/programs/blender.nix
    #./programs/resolve.nix
    ../../../configs/programs/inkscape.nix
    ../../../configs/programs/libre-office.nix
    # ../../../configs/programs/gimp.nix
    ../../../configs/programs/krita.nix
    ../../../configs/programs/thunderbird.nix
    ../../../configs/programs/cura.nix
    ../../../configs/programs/boxes.nix
    ../../../configs/programs/meshlab.nix
    ../../../configs/programs/obs-studio.nix
    ../../../configs/programs/shotcut.nix
    ../../../configs/programs/gparted.nix
    # ../../../configs/programs/ventoy.nix
    ../../../configs/programs/godot.nix
    ../../../configs/programs/f3d.nix

    # Development
    ../../../configs/programs/postgres.nix
    ../../../configs/programs/nix.nix
    ../../../configs/programs/git.nix
    ../../../configs/programs/vscodium/vscodium.nix
    ../../../configs/programs/cpp.nix

    # Communication
    ../../../configs/programs/discord.nix
    ../../../configs/programs/signal.nix
    ../../../configs/programs/slack.nix

    # Media
    ../../../configs/programs/spotify/spotify.nix
    ../../../configs/programs/heroic.nix

    # System
    ../../../configs/programs/file-viewers.nix
    ../../../configs/programs/fonts.nix
    ../../../configs/programs/mouse.nix
    ../../../configs/programs/kdiskmark.nix
    ../../../configs/system/default-apps.nix

    ../../../configs/programs/stylix.nix
  ];

  home.stateVersion = "24.05";
}
