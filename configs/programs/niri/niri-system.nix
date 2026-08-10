{
  pkgs,
  inputs,
  lib,
  ...
}: {
  imports = [
    inputs.niri.nixosModules.niri
  ];

  security.polkit.enable = true;
  services.gnome.gnome-keyring.enable = true;
  systemd.user.services.niri-flake-polkit = lib.mkForce {
    description = "PolicyKit Authentication Agent provided by niri-flake";
    wantedBy = ["niri.service"];
    after = ["graphical-session.target"];
    partOf = ["graphical-session.target"];
    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
      Restart = "on-failure";
      RestartSec = 1;
      TimeoutStopSec = 10;
    };
  };

  security.pam.services.swaylock = {};

  programs.niri.enable = true;

  # portal-gnome refuses to initialize on Wayland if GDK_BACKEND is forced
  # to anything other than exactly "wayland" (e.g. "wayland,x11" fails).
  systemd.user.services.xdg-desktop-portal-gnome.environment = {
    XDG_CURRENT_DESKTOP = "GNOME";
    GDK_BACKEND = "wayland";
  };
}
