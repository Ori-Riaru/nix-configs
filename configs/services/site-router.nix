{inputs, ...}: {
  imports = [inputs.site-router.nixosModules.site-router];

  services.site-router = {
    enable = true;
    port = 3553;
    address = "127.0.0.1";
  };
}
