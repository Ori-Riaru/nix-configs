{lib, ...}: {
  imports = [
    ./hardware-configuration.nix

    ../../modules/_share/global
    ../../users/riaru

    ../../modules/services/samba.nix
    ../../modules/services/mastodon
    ../../modules/services/nextcloud.nix
    ../../modules/services/factorio.nix
    ../../modules/services/tailscale.nix
    ../../modules/services/nfs.nix
    ../../modules/services/restic.nix
    ../../modules/services/jellyfin.nix
    ../../modules/services/blocky.nix

    #./services/homeassistant.nix
    #./services/hydroxide.nix
    #./services/palworld.nix
  ];

  environment.variables = {
    NH_FLAKE = lib.mkForce "/data/nfs/riaru/Projects/nix-configs";
  };  

  # Bootloader
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sdb";
  boot.loader.grub.useOSProber = true;

  networking.hostName = "fujin";

  system.stateVersion = "24.05";
}
