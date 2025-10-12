# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  settings,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix

    ../../configs/system/global
    ../../configs/system/systemd-boot.nix
    ../../configs/system/audio.nix
    ../../configs/system/kde.nix
    ../../configs/system/gdm.nix
    ../../configs/system/bluetooth.nix
    ../../configs/system/printing.nix
    ../../configs/system/steam.nix
    ../../configs/programs/niri/niri-system.nix
    ../../configs/programs/smb-mount.nix
    ../../configs/system/virtulization.nix
    ../../configs/services/tailscale.nix
    ../../configs/programs/nfs-client.nix
    ../../configs/services/hamachi.nix
    ../../configs/services/quake.nix
    ../../configs/programs/kdeconnect.nix
    ../../configs/programs/monado/monado.nix
    ../../configs/programs/sops.nix
    ../../configs/programs/kanata.nix
    ../../configs/programs/sudo.nix

    ../../users/riaru

    inputs.walker.nixosModules.walker
  ];

  networking.hostName = "lain";

  environment.systemPackages = with pkgs; [
    # rustc
    # cargo
    # rustfmt
    # rust-analyzer
    # clippy
    # pkg-config
    # glib
    # gsettings-desktop-schemas
  ];

  # environment.sessionVariables = {
  #   XDG_DATA_DIRS = ["${pkgs.gsettings-desktop-schemas}/share/gsettings-schemas/${pkgs.gsettings-desktop-schemas.name}"];
  # };

  # programs.walker = {
  #   enable = true;
  #   runAsService = true;
  #   config = {
  #     debug = true;
  #   };
  # };

  # programs.walker = {
  #   enable = true;
  #   runAsService = true;

  #   config = {
  #     placeholders."default" = {
  #       input = "search";
  #       list = "Example";
  #     };

  #     providers.prefixes = [
  #       {
  #         provider = "websearch";
  #         prefix = "+";
  #       }
  #       {
  #         provider = "providerlist";
  #         prefix = "_";
  #       }
  #     ];

  #     keybinds.quick_activate = ["F1" "F2" "F12"];
  #   };

  #   elephant = {
  #     debug = true;
  #     providers = [
  #       "files"
  #       "desktopapplications"
  #       "calc"
  #       "symbols"
  #       "unicode"
  #       "providerlist"
  #     ];
  #     config = {
  #       files = {
  #         providers = {
  #           files = {
  #             min_score = 50;
  #           };
  #         };
  #       };
  #     };
  #   };

  #   # If this is not set the default styling is used.
  #   theme.style = ''
  #     @define-color window_bg_color ${settings.section};
  #     @define-color accent_bg_color ${settings.subtext};
  #     @define-color theme_fg_color ${settings.text};

  #     * {
  #       all: unset;
  #     }

  #     .normal-icons {
  #       -gtk-icon-size: 16px;
  #     }

  #     .large-icons {
  #       -gtk-icon-size: 32px;
  #     }

  #     scrollbar {
  #       opacity: 0;
  #     }

  #     .box-wrapper {
  #       box-shadow:
  #         0 19px 38px rgba(0, 0, 0, 0.3),
  #         0 15px 12px rgba(0, 0, 0, 0.22);
  #       background: @window_bg_color;
  #       padding: 20px;
  #       border-radius: 20px;
  #       border: 1px solid darker(@accent_bg_color);
  #     }

  #     .preview-box,
  #     .elephant-hint,
  #     .placeholder {
  #       color: @theme_fg_color;
  #     }

  #     .box {
  #     }

  #     .search-container {
  #       border-radius: 10px;
  #     }

  #     .input placeholder {
  #       opacity: 0.5;
  #     }

  #     .input {
  #       caret-color: @theme_fg_color;
  #       background: lighter(@window_bg_color);
  #       padding: 10px;
  #       color: @theme_fg_color;
  #     }

  #     .input:focus,
  #     .input:active {
  #     }

  #     .content-container {
  #     }

  #     .placeholder {
  #     }

  #     .scroll {
  #     }

  #     .list {
  #       color: @theme_fg_color;
  #     }

  #     child {
  #     }

  #     .item-box {
  #       border-radius: 10px;
  #       padding: 10px;
  #     }

  #     .item-quick-activation {
  #       margin-left: 10px;
  #       background: alpha(@accent_bg_color, 0.25);
  #       border-radius: 5px;
  #       padding: 10px;
  #     }

  #     child:hover .item-box,
  #     child:selected .item-box {
  #       background: alpha(@accent_bg_color, 0.25);
  #     }

  #     .item-text-box {
  #     }

  #     .item-text {
  #     }

  #     .item-subtext {
  #       font-size: 12px;
  #       opacity: 0.5;
  #     }

  #     .item-image {
  #       margin-right: 10px;
  #     }

  #     .preview {
  #       border: 1px solid alpha(@accent_bg_color, 0.25);
  #       padding: 10px;
  #       border-radius: 10px;
  #       color: @theme_fg_color;
  #     }

  #     .calc .item-text {
  #       font-size: 24px;
  #     }

  #     .calc .item-subtext {
  #     }

  #     .symbols .item-image {
  #       font-size: 24px;
  #     }

  #     .todo.done .item-text-box {
  #       opacity: 0.25;
  #     }

  #     .todo.urgent {
  #       font-size: 24px;
  #     }

  #     .todo.active {
  #       font-weight: bold;
  #     }

  #     .bluetooth.disconnected {
  #       opacity: 0.5;
  #     }

  #     .preview .large-icons {
  #       -gtk-icon-size: 64px;
  #     }

  #     .keybinds-wrapper {
  #       border-top: 1px solid lighter(@window_bg_color);
  #       font-size: 12px;
  #       opacity: 0.5;
  #       color: @theme_fg_color;
  #     }

  #     .keybinds {
  #     }

  #     .keybind {
  #     }

  #     .keybind-bind {
  #       /* color: lighter(@window_bg_color); */
  #       font-weight: bold;
  #     }

  #     .keybind-label {
  #     }
  #   '';
  # };

  #Nvidia
  hardware.graphics = {
    enable = true;
  };

  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {
    open = true;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.beta;
    modesetting.enable = true;
    powerManagement.enable = true;
    powerManagement.finegrained = false;
  };

  services.ratbagd.enable = true;

  hardware.uinput.enable = true;
  users.groups.uinput.members = ["${settings.username}"];
  users.groups.input.members = ["${settings.username}"];

  system.stateVersion = "24.05";
}
