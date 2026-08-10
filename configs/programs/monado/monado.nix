{pkgs, config, ...}: {
  # (services.monado = {
  #   enable = true;
  #   defaultRuntime = true;
  #   highPriority = true;
  # };

  # systemd.user.services.monado.environment = {
  #   STEAMVR_LH_ENABLE = "1";
  #   XRT_COMPOSITOR_COMPUTE = "1";
  #   WMR_HANDTRACKING = "0";
  #   WMR_LOG = "debug";
  #   U_PACING_COMP_TIME_FRACTION_PERCENT = "90";
  #   XRT_COMPOSITOR_USE_PRESENT_WAIT = "FALSE";
  #   XRT_COMPOSITOR_FORCE_WAYLAND_DIRECT = "1";
  #   VIT_SYSTEM_LIBRARY_PATH = "${pkgs.basalt-monado}/lib/libbasalt.so";
  # };

  # services.udev.extraRules = ''
  #   # Samsung Odyssey (WMR)
  #   SUBSYSTEM=="usb", ATTR{idVendor}=="04e8", ATTR{idProduct}=="7310", MODE="0666", GROUP="plugdev", TAG+="uaccess"
  #   SUBSYSTEM=="usb", ATTR{idVendor}=="04e8", ATTR{idProduct}=="7312", MODE="0666", GROUP="plugdev", TAG+="uaccess"
  #   # WMR motion controllers
  #   SUBSYSTEM=="usb", ATTR{idVendor}=="04e8", ATTR{idProduct}=="065d", MODE="0666", GROUP="plugdev", TAG+="uaccess"
  #   # Microsoft WMR hub/controller (generic)
  #   SUBSYSTEM=="usb", ATTR{idVendor}=="045e", ATTR{idProduct}=="0659", MODE="0666", GROUP="plugdev", TAG+="uaccess"
  # '';)
}
