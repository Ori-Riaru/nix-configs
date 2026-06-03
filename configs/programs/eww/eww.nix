{
  pkgs,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    inputs.niri-minimap.packages.${pkgs.stdenv.hostPlatform.system}.default
    python314Packages.python-kasa
    pavucontrol
  ];

  programs.eww = {
    enable = true;
  };

  systemd.user.services = {
    eww-daemon = {
      Unit = {
        Description = "Eww Daemon";
        PartOf = ["niri.service"];
        After = ["niri.service"];
      };
      Service = {
        Type = "forking";
        ExecStart = "${pkgs.eww}/bin/eww daemon";
        Restart = "on-failure";
        RestartSec = 3;
      };
      Install.WantedBy = ["niri.service"];
    };

    eww-bar = {
      Unit = {
        Description = "Eww Bar";
        After = ["eww-daemon.service"];
        Requires = ["eww-daemon.service"];
      };
      Service = {
        Type = "oneshot";
        RemainAfterExit = true;
        ExecStart = "${pkgs.eww}/bin/eww open bar";
      };
      Install.WantedBy = ["niri.service"];
    };
  };

  home.file.".config/eww" = {
    source = ./eww;
    recursive = true;
  };
}
