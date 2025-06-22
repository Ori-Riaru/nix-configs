{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    factorio-headless-experimental
  ];

  services.factorio = {
    enable = true;
    openFirewall = true;
    requireUserVerification = false;
  };
}
