{...}: {
  imports = [
    ./hardware-configuration.nix

    ../_share/global
    ../../users/riaru

    #../share/features/vscode-server.nix
    #./services/nextcloud.nix
    #./services/homeassistant.nix
    #./services/hydroxide.nix
    #./services/palworld.nix
    ../../modules/services/samba.nix
    ../../modules/services/mastodon
  ];

  networking.hostName = "fujin";

  # Bootloader
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sdb";
  boot.loader.grub.useOSProber = true;

  system.stateVersion = "24.05";
}
