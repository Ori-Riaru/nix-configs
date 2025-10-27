{settings, ...}: {
  services.xserver.xkb = {
    layout = "us,us";
    variant = ",${settings.keyboard}";
  };

  console.keyMap = "${settings.keyboard}";
}
