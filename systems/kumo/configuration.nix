{lib, ...}: {
  imports = [
    ./hardware-configuration.nix

    ../../configs/system/global
    ../../users/riaru

    ../../configs/services/samba.nix
    ../../configs/services/mastodon/mastodon.nix
    ../../configs/services/nextcloud.nix
    ../../configs/services/factorio.nix
    ../../configs/services/tailscale.nix
    ../../configs/services/nfs.nix
    ../../configs/services/restic.nix
    ../../configs/services/jellyfin.nix
    ../../configs/services/blocky.nix
    ../../configs/services/glance.nix
    ../../configs/services/minecraft.nix
    ../../configs/services/inadyn.nix

    ../../configs/programs/sops.nix
    ../../configs/programs/sudo.nix

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

  networking.hostName = "kumo";

  system.stateVersion = "24.05";
}
