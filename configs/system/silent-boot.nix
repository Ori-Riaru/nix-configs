{pkgs, ...}: {
  boot = {
    consoleLogLevel = 3;
    kernelParams = [
      "quiet"
      "udev.log_level=3"
      "systemd.show_status=auto"
    ];

    loader.timeout = 0;
  };
}
