{...}: {
  imports = [
    ./global
    
    # CLI
    ./programs/starship.nix
    ./programs/zoxide.nix
    ./programs/screen-savers.nix
    ./programs/cli-tools.nix
    ./programs/fish.nix

    # Tools
    ./programs/firefox
    ./programs/chromium.nix
    ./programs/kitty.nix
    ./programs/obsidian.nix
    ./programs/blender.nix
    #./programs/resolve.nix
    ./programs/inkscape.nix
    ./programs/libre-office.nix
    ./programs/gimp.nix
    ./programs/krita.nix
    ./programs/thunderbird.nix
    ./programs/cura.nix
    ./programs/boxes.nix
    ./programs/meshlab.nix
    ./programs/obs-studio.nix

    # Development
    ./programs/java.nix
    ./programs/postgres.nix
    ./programs/nix.nix
    ./programs/git.nix
    ./programs/vscodium
    ./programs/rust.nix
    ./programs/cpp.nix

    # Communication
    ./programs/discord.nix

    # Media
    ./programs/spotify
    # ./programs/suwayomi.nix
    ./programs/gaming.nix

    # System 
    ./programs/kdeconnect.nix
    ./programs/xremap.nix
    ./programs/maliit.nix
    ./programs/file-viewers.nix
    ./programs/fonts.nix
    # ./programs/kde.nix
    ./programs/mouse.nix
    ./programs/touchegg.nix
    ./programs/kdiskmark.nix 
  ];

  home.stateVersion = "24.05";
}
