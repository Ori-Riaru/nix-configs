{pkgs, ...}: {
  # launch with sudo -E gparted because of wayland bug or something
  environment.systemPackages = with pkgs; [
    gparted
  ];
}
