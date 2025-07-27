{...}: {
  imports = [
    ../../../configs/system/home-global
    ../../../configs/system/folders.nix

    # CLI
    ../../../configs/programs/starship.nix
    ../../../configs/programs/zoxide.nix
    ../../../configs/programs/screen-savers.nix
    ../../../configs/programs/cli-tools.nix
    ../../../configs/programs/fish.nix

    # Tools
    ../../../configs/programs/firefox
    ../../../configs/programs/chromium.nix
    ../../../configs/programs/kitty.nix
    ../../../configs/programs/obsidian.nix
    ../../../configs/programs/blender.nix
    ../../../configs/programs/inkscape.nix
    ../../../configs/programs/libre-office.nix
    #Qq../../../configs/programs/gimp.nix
    ../../../configs/programs/krita.nix
    ../../../configs/programs/thunderbird.nix
    ../../../configs/programs/cura.nix
    ../../../configs/programs/boxes.nix
    ../../../configs/programs/meshlab.nix
    ../../../configs/programs/obs-studio.nix
    ../../../configs/programs/shotcut.nix
    ../../../configs/programs/gparted.nix
    ../../../configs/programs/godot.nix
    ../../../configs/programs/f3d.nix
    ../../../configs/programs/nautilus.nix
    ../../../configs/programs/mangohud.nix
    ../../../configs/programs/walker.nix
    ../../../configs/programs/shadps4.nix

    # Development
    ../../../configs/programs/java.nix
    ../../../configs/programs/postgres.nix
    ../../../configs/programs/nix.nix
    ../../../configs/programs/git.nix
    ../../../configs/programs/vscodium
    ../../../configs/programs/cpp.nix
    ../../../configs/programs/micro.nix

    # Communication
    ../../../configs/programs/discord.nix
    ../../../configs/programs/signal.nix

    # Media
    ../../../configs/programs/spotify

    ../../../configs/programs/gaming.nix

  
    ../../../configs/programs/file-viewers.nix
    ../../../configs/programs/fonts.nix
    ../../../configs/programs/mouse.nix
    ../../../configs/programs/kdiskmark.nix
    ../../../configs/programs/niri
    ../../../configs/programs/alacritty.nix
    ../../../configs/programs/waybar
    ../../../configs/programs/monado/monado-home.nix
    ../../../configs/programs/nvtop.nix

    ../../../configs/programs/stylix.nix

    ../../../configs/system/default-apps.nix

    ### OLD
    #./programs/resolve.nix
    # ../../../configs/programs/kde
    # ../../../configs/programs/touchegg.nix
    # ../../../configs/programs/ventoy.nix
  ];

  home.stateVersion = "24.05";
}
