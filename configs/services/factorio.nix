{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    factorio-headless-experimental
  ];

  services.factorio = {
    enable = false;
    openFirewall = true;
    requireUserVerification = false;
  };
}
