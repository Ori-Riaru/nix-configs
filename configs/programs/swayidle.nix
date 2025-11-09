{pkgs, ...}: {
  services.swayidle = {
    enable = true;
    events = [
      {
        event = "before-sleep";
        command = "${pkgs.hyprlock}/bin/hyprlock";
      }
      {
        event = "lock";
        command = "${pkgs.hyprlock}/bin/hyprlock";
      }
    ];
    timeouts = [
      {
        timeout = 1500; # 25 minutes - dim screen
        command = "${pkgs.brightnessctl}/bin/brightnessctl -s set 5%";
        resumeCommand = "${pkgs.brightnessctl}/bin/brightnessctl -r";
      }
      {
        timeout = 1680; # 28 minutes - lock session
        command = "${pkgs.systemd}/bin/loginctl lock-session";
      }
      {
        timeout = 1800; # 30 minutes - turn off monitors
        command = "${pkgs.niri}/bin/niri msg action power-off-monitors";
        resumeCommand = "${pkgs.niri}/bin/niri msg action power-on-monitors";
      }
      {
        timeout = 2100; # 35 minutes - suspend
        command = "${pkgs.systemd}/bin/systemctl suspend";
      }
    ];
  };

  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        hide_cursor = true;
      };
    };
  };
}
