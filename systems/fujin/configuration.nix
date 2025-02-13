{...}: {
  imports = [
    ./hardware-configuration.nix

    ../share/global
    ../share/users/riaru.nix

    #../share/features/vscode-server.nix

    #./services/nextcloud.nix
    #./services/homeassistant.nix
    #./services/hydroxide.nix
    ./services/palworld.nix
    ./services/mastodon.nix
  ];

  networking.hostName = "fujin";

  # Bootloader
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sdb";
  boot.loader.grub.useOSProber = true;

  system.stateVersion = "24.05";
}
