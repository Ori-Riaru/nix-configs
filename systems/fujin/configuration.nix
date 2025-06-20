{...}: {
  imports = [
    ./hardware-configuration.nix

    ../../modules/_share/global
    ../../users/riaru

    ../../modules/services/samba.nix
    ../../modules/services/mastodon
    ../../modules/services/nextcloud.nix

    #./services/homeassistant.nix
    #./services/hydroxide.nix
    #./services/palworld.nix

  ];

  # Bootloader
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sdb";
  boot.loader.grub.useOSProber = true;

  networking.hostName = "fujin";

  system.stateVersion = "24.05";
}
