{pkgs, settings, ...}: {
  # home-manager.users.${settings.username}.services.kdeconnect.enable = true;

  # networking.firewall = rec {
  #   allowedTCPPortRanges = [
  #     {
  #       from = 1714;
  #       to = 1764;
  #     }
  #   ];
  #   allowedUDPPortRanges = allowedTCPPortRanges;
  # };

  services.kdeconnect = {
    enable = true;
    package = pkgs.kdePackages.kdeconnect-kde;
    indicator = false;
  };
}
