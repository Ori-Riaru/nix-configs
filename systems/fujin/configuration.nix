{...}: {
  imports = [
    ./hardware-configuration.nix

    ../_share/global
    ../../users/riaru

    #../modules/services/nextcloud.nix
    #../modules/services/homeassistant.nix
    #../modules/services/hydroxide.nix
    ../../modules/services/palworld.nix
    ../../modules/services/mastodon.nix
  ];

  networking.hostName = "fujin";

  # Bootloader
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sdb";
  boot.loader.grub.useOSProber = true;

  system.stateVersion = "24.05";
}
