{...}: {
  imports = [
    ../_share/global

    # CLI
    ../../modules/programs/starship.nix
    ../../modules/programs/zoxide.nix
    ../../modules/programs/screen-savers.nix
    ../../modules/programs/cli-tools.nix
    ../../modules/programs/fish.nix

    # Tools
    ../../modules/programs/firefox
    ../../modules/programs/chromium.nix
    ../../modules/programs/kitty.nix
    ../../modules/programs/obsidian.nix
    ../../modules/programs/blender.nix
    #./programs/resolve.nix
    ../../modules/programs/inkscape.nix
    ../../modules/programs/libre-office.nix
    ../../modules/programs/gimp.nix
    ../../modules/programs/krita.nix
    ../../modules/programs/thunderbird.nix
    ../../modules/programs/cura.nix
    ../../modules/programs/boxes.nix
    ../../modules/programs/meshlab.nix
    ../../modules/programs/obs-studio.nix
    ../../modules/programs/shotcut.nix
    ../../modules/programs/gparted.nix
    ../../modules/programs/ventoy.nix
    ../../modules/programs/godot.nix
    ../../modules/programs/f3d.nix

    # Development
    ../../modules/programs/java.nix
    ../../modules/programs/postgres.nix
    ../../modules/programs/nix.nix
    ../../modules/programs/git.nix
    ../../modules/programs/vscodium
    ../../modules/programs/rust.nix
    ../../modules/programs/cpp.nix

    # Communication
    ../../modules/programs/discord.nix

    # Media
    ../../modules/programs/spotify
    # ./programs/suwayomi.nix
    ../../modules/programs/gaming.nix

    # System
    ../../modules/programs/kdeconnect.nix
    ../../modules/programs/xremap.nix
    ../../modules/programs/maliit.nix
    ../../modules/programs/file-viewers.nix
    ../../modules/programs/fonts.nix
    ../../modules/programs/kde
    ../../modules/programs/mouse.nix
    ../../modules/programs/touchegg.nix
    ../../modules/programs/kdiskmark.nix
    # ./programs/clear-touch.nix

    ../_share/folders.nix
  ];

  home.stateVersion = "24.05";
}
