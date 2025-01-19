{settings, ...}: {
  services.xserver.xkb = {
    layout = "us";
    variant = "${settings.keyboard}";
  };

  console.keyMap = "${settings.keyboard}";
}
