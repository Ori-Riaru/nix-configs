{pkgs, ...}: {
  # Broken: must be updated
  # services.monado = {
  #   enable = true;
  #   defaultRuntime = true;
  # };

  # environment.systemPackages = with pkgs; [basalt-monado];

  # programs.git = {
  #   enable = true;
  #   lfs.enable = true;
  # };

  # systemd.user.services.monado.environment = {
  #   STEAMVR_LH_ENABLE = "1";
  #   XRT_COMPOSITOR_COMPUTE = "1";
  #   WMR_HANDTRACKING = "0";
  #   XRT_DEBUG_GUI = "0";
  # };
}
