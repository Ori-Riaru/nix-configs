{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    xwayland-satellite
    # gnome-keyring
    # plasma-polkit-agent
  ];

  programs.niri.enable = true;
}
