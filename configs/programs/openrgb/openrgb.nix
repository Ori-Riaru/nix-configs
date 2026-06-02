{pkgs, ...}: {
  home.packages = with pkgs; [
    openrgb
  ];

  systemd.user.services = {
    openrgb-profile-off = {
      Unit = {
        Description = "OpenRGB Profile Off";
        PartOf = ["niri.service"];
        After = ["niri.service"];
      };
      Service = {
        Type = "oneshot";
        RemainAfterExit = true;
        ExecStart = "${pkgs.openrgb}/bin/openrgb --profile off";
      };
      Install.WantedBy = ["niri.service"];
    };
  };
}
