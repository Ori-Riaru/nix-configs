{
  pkgs,
  settings,
  lib,
  ...
}: {
  home.packages = with pkgs; [
    awww
  ];

  systemd.user.services = {
    awww-daemon = {
      Unit = {
        Description = "Awww Wallpaper Daemon";
        PartOf = ["niri.service"];
        After = ["niri.service"];
      };
      Service = {
        Type = "simple";
        ExecStart = "${pkgs.awww}/bin/awww-daemon";
        Restart = "on-failure";
        RestartSec = 3;
      };
      Install.WantedBy = ["niri.service"];
    };

    awww-wallpaper = {
      Unit = {
        Description = "Awww Wallpaper Setup";
        After = ["awww-daemon.service"];
        Requires = ["awww-daemon.service"];
      };
      Service = {
        Type = "oneshot";
        RemainAfterExit = true;
        ExecStart = [
          "${pkgs.awww}/bin/awww clear ${lib.replaceStrings ["#"] [""] settings.base}"
          "${pkgs.awww}/bin/awww img ${settings.wallpaper} --outputs DP-2 --transition-type none"
          "${pkgs.awww}/bin/awww img ${settings.wallpaper2} --outputs DP-3 --transition-type none"
        ];
      };
      Install.WantedBy = ["niri.service"];
    };
  };
}
