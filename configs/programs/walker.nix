{
  lib,
  pkgs,
  inputs,
  settings,
  ...
}: {
  imports = [
    inputs.walker.homeManagerModules.walker
  ];

  programs.walker = {
    enable = true;
    runAsService = true;

    config = {
      # placeholders."default" = {
      #   input = "search";
      #   list = "Example";
      # };

      # providers.prefixes = [
      #   {
      #     provider = "websearch";
      #     prefix = "+";
      #   }
      #   {
      #     provider = "providerlist";
      #     prefix = "_";
      #   }
      # ];

      keybinds.quick_activate = [];
    };

    elephant = {
      # debug = true;
      # providers = [
      #   "files"
      #   "desktopapplications"
      #   "calc"
      #   "symbols"
      #   "providerlist"
      # ];
      # config = {
      #   files = {
      #     providers = {
      #       files = {
      #         min_score = 50;
      #       };
      #     };
      #   };
      # };
    };

    # If this is not set the default styling is used.
    theme.style = ''
      @define-color window_bg_color ${settings.section};
      @define-color accent_bg_color ${settings.subtext};
      @define-color theme_fg_color ${settings.text};

      * {
        all: unset;
      }

      .normal-icons {
        -gtk-icon-size: 16px;
      }

      .large-icons {
        -gtk-icon-size: 32px;
      }

      scrollbar {
        opacity: 0;
      }

      .box-wrapper {
        box-shadow:
          0 19px 38px rgba(0, 0, 0, 0.3),
          0 15px 12px rgba(0, 0, 0, 0.22);
        background: @window_bg_color;
        padding: 20px;
        border-radius: 20px;
        border: 1px solid darker(@accent_bg_color);
      }

      .preview-box,
      .elephant-hint,
      .placeholder {
        color: @theme_fg_color;
      }

      .box {
      }

      .search-container {
        border-radius: 10px;
      }

      .input placeholder {
        opacity: 0.5;
      }

      .input {
        caret-color: @theme_fg_color;
        background: lighter(@window_bg_color);
        padding: 10px;
        color: @theme_fg_color;
      }

      .input:focus,
      .input:active {
      }

      .content-container {
      }

      .placeholder {
      }

      .scroll {
      }

      .list {
        color: @theme_fg_color;
      }

      child {
      }

      .item-box {
        border-radius: 10px;
        padding: 10px;
      }

      .item-quick-activation {
        margin-left: 10px;
        background: alpha(@accent_bg_color, 0.25);
        border-radius: 5px;
        padding: 10px;
      }

      child:hover .item-box,
      child:selected .item-box {
        background: alpha(@accent_bg_color, 0.25);
      }

      .item-text-box {
      }

      .item-text {
      }

      .item-subtext {
        font-size: 12px;
        opacity: 0.5;
      }

      .item-image {
        margin-right: 10px;
      }

      .preview {
        border: 1px solid alpha(@accent_bg_color, 0.25);
        padding: 10px;
        border-radius: 10px;
        color: @theme_fg_color;
      }

      .calc .item-text {
        font-size: 24px;
      }

      .calc .item-subtext {
      }

      .symbols .item-image {
        font-size: 24px;
      }

      .todo.done .item-text-box {
        opacity: 0.25;
      }

      .todo.urgent {
        font-size: 24px;
      }

      .todo.active {
        font-weight: bold;
      }

      .bluetooth.disconnected {
        opacity: 0.5;
      }

      .preview .large-icons {
        -gtk-icon-size: 64px;
      }

      .keybinds-wrapper {
        border-top: 1px solid lighter(@window_bg_color);
        font-size: 12px;
        opacity: 0.5;
        color: @theme_fg_color;
      }

      .keybinds {
      }

      .keybind {
      }

      .keybind-bind {
        /* color: lighter(@window_bg_color); */
        font-weight: bold;
      }

      .keybind-label {
      }
    '';
  };

  nix = {
    package = pkgs.nix;
    settings = {
      extra-substituters = [
        "https://walker.cachix.org"
        "https://walker-git.cachix.org"
      ];
      extra-trusted-public-keys = [
        "walker.cachix.org-1:fG8q+uAaMqhsMxWjwvk0IMb4mFPFLqHjuvfwQxE4oJM="
        "walker-git.cachix.org-1:vmC0ocfPWh0S/vRAQGtChuiZBTAe4wiKDeyyXM0/7pM="
      ];
    };
  };
}
