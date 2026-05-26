{
  boot.loader = {
    systemd-boot = {
      enable = true;
      configurationLimit = 120;
    };
    efi.canTouchEfiVariables = true;
  };
}
