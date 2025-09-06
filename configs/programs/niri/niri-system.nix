{
  pkgs,
  inputs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    xwayland-satellite
    xdg-utils
  ];

  programs.niri.enable = true;

  xdg = {
    autostart.enable = true;
    menus.enable = true;
    mime.enable = true;
    icons.enable = true;
  };

  security.polkit.enable = true;
  services.gnome.gnome-keyring.enable = true;
  systemd.user.services.niri-flake-polkit = {
    description = "PolicyKit Authentication Agent";
    wantedBy = ["niri.service"];
    after = ["graphical-session.target"];
    partOf = ["graphical-session.target"];
    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.kdePackages.polkit-kde-agent-1}/libexec/polkit-kde-authentication-agent-1";
      Restart = "on-failure";
      RestartSec = 1;
      TimeoutStopSec = 10;
    };
  };

  programs.dconf.enable = true;

  fonts.enableDefaultPackages = true;
}
