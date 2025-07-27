{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    hydroxide
  ];
}
