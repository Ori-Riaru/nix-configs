{
  pkgs,
  config,
  ...
}: {
  # home.packages = [pkgs.xrizer];

  # xdg.configFile."openvr/openvrpaths.vrpath".text = ''
  #   {
  #     "version": 1,
  #     "runtime": [
  #       "${pkgs.xrizer}/lib/xrizer"
  #     ]
  #   }
  # '';
}
