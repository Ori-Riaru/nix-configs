{...}: {
  services.monado = {
    enable = true;
    defaultRuntime = true;
  };

  programs.git = {
    enable = true;
    lfs.enable = true;
  };

  systemd.user.services.monado.environment = {
    STEAMVR_LH_ENABLE = "1";
    XRT_COMPOSITOR_COMPUTE = "1";
  };
}
