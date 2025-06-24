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

  systemd.user.services.niri-polkit = {
    description = "Authentication Agent provided by niri";
    wantedBy = ["niri.service"];
    after = ["graphical-session.target"];
    partOf = ["graphical-session.target"];
    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.libsForQt5.polkit-kde-agent}/libexec/polkit-kde-authentication-agent-1";
      Restart = "on-failure";
      RestartSec = 1;
      TimeoutStopSec = 10;
    };
  };

  programs.dconf.enable = true;

  fonts.enableDefaultPackages = true;
}
