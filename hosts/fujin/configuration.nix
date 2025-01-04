{...}: {
  imports = [
    ./hardware-configuration.nix

    ../common/global
    ../common/users/riaru

    ./services/nextcloud.nix
    #./services/homeassistant.nix
    #./services/hydroxide.nix
    ./services/palworld.nix
  ];

  networking.hostName = "fujin";

  # Bootloader
  # boot.loader.systemd-boot.enable = true;
 
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sdb";
  boot.loader.grub.useOSProber = true;

  system.stateVersion = "24.05";
}
