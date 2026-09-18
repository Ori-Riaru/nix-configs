{
  pkgs,
  config,
  lib,
  ...
}: let
  inherit (config) theme;

  rgba = alpha: hex: let
    hexToInt = v: (builtins.fromTOML "x = 0x${v}").x;
    h = lib.removePrefix "#" hex;
    r = builtins.substring 0 2 h;
    g = builtins.substring 2 2 h;
    b = builtins.substring 4 2 h;
  in "rgba(${toString (hexToInt r)},${toString (hexToInt g)},${toString (hexToInt b)},${alpha})";
in {
  home.packages = with pkgs; [
    heroic
  ];

  home.file.".config/heroic/themes/custom.css".text = ''
    body.custom {
      /* Backgrounds */
      --background: ${theme.base};
      --background-darker: ${theme.base};
      --background-darker-80: ${rgba "0.8" theme.base};
      --background-secondary: ${theme.overlay};
      --background-lighter: ${theme.float};
      --body-background: ${theme.section};
      --current-background: ${theme.section};
      --navbar-background: ${theme.card};
      --navbar-active-background: ${theme.float};
      --input-background: ${theme.card};
      --modal-background: ${theme.card};
      --modal-backdrop: ${rgba "0.6" theme.black};
      --modal-border: ${theme.hidden};
      --search-bar-background: ${theme.card};
      --search-bar-border: ${theme.hidden};
      --icons-background: ${theme.card};
      --osk-background: ${theme.section};
      --osk-button-background: ${theme.card};
      --osk-button-border: ${theme.overlay};
      --controller-hints-background: transparent;
      --divider: ${theme.hidden};

      /* Text */
      --text-default: ${theme.text};
      --text-secondary: ${theme.subtext};
      --text-tertiary: ${theme.muted};
      --text-quartenary: ${theme.hidden};
      --text-hover: ${theme.accent};
      --text-title: ${theme.white};
      --text-pause-cancel: ${theme.teal-bright};
      --text-danger: ${theme.red};
      --text-gametitle: ${theme.text};
      --text-log: ${theme.yellow};
      --text-warning: ${theme.yellow-bright};

      /* Accent / primary */
      --accent: ${theme.accent};
      --accent-overlay: ${theme.accent-bright};
      --primary: ${theme.accent};
      --primary-hover: ${theme.accent-bright};
      --link-highlight: ${theme.accent};
      --button-stroke: ${theme.accent};
      --alphabet-filter-accent-color: ${theme.accent};
      --alphabet-filter-accent-hover: ${theme.accent-bright};

      /* Buttons */
      --primary-button: ${theme.accent};
      --secondary-button: ${theme.accent-bright};
      --secondary-button-overlay: ${theme.white};
      --play-button: ${theme.accent};
      --install-button: ${theme.secondary};
      --download-button: ${theme.secondary};
      --download-button-overlay: ${theme.secondary-bright};
      --cancel-button: ${theme.orange};
      --cancel-button-overlay: ${theme.orange-bright};
      --tertiary-button: ${theme.yellow};
      --tertiary-button-overlay: ${theme.yellow-bright};
      --success-button: ${theme.teal};

      /* Status */
      --success: ${theme.teal};
      --success-hover: ${theme.teal-bright};
      --danger: ${theme.red};
      --danger-hover: ${theme.red-bright};

      /* Navbar & icons */
      --navbar-accent: ${theme.accent};
      --navbar-active: ${theme.text};
      --navbar-inactive: ${theme.subtext};
      --icon-disabled: ${theme.muted};
      --action-icon: ${theme.text};
      --action-icon-hover: ${theme.accent};
      --action-icon-active: ${theme.accent-bright};

      /* Anticheat */
      --anticheat-denied: ${theme.red};
      --anticheat-broken: ${theme.orange};
      --anticheat-running: ${theme.cyan};
      --anticheat-supported: ${theme.teal};
      --anticheat-planned: ${theme.purple};
      --anticheat-unknown: ${theme.yellow};

      /* Gradients */
      --gamecard-title-color: ${rgba "0.82" theme.base};
      --gradient-gamecard: linear-gradient(180deg, ${rgba "0.45" theme.black} 1.8%, var(--gamecard-title-color) 45%);
      --gradient-body-background: linear-gradient(90deg, var(--background-darker) -32px, var(--body-background) 64px, var(--body-background) 100%);

      /* Tour popups */
      --tour-popup-background: ${theme.card};
      --tour-bullet-active: ${theme.accent};
      --tour-bullet-inactive: ${theme.accent-dim};
      --tour-popup-title: ${theme.text};
      --tour-popup-skip-color: ${theme.subtext};
      --tour-popup-skip-color-hover: ${theme.text};

      /* Compatibility aliases */
      --secondary: ${theme.accent-bright};
    }

    /* Branding Removal */

    .Sidebar .heroicIcon {
      display: none !important;
    }

    .Sidebar .heroicVersionContainer {
      display: none !important;
    }

    .Sidebar .SidebarLinks {
      margin-top: 20px !important;
    }
  '';
}
