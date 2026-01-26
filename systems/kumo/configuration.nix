{lib, ...}: {
  imports = [
    ./hardware-configuration.nix

    ../../users/riaru

    ../../configs/groups/global.nix
    ../../configs/programs/sops.nix
    ../../configs/programs/sudo.nix

    ../../configs/services/samba.nix
    ../../configs/services/mastodon/mastodon.nix
    ../../configs/services/copyparty.nix
    ../../configs/services/tailscale.nix
    ../../configs/services/nfs.nix
    ../../configs/services/restic.nix
    ../../configs/services/jellyfin.nix
    ../../configs/services/blocky.nix
    ../../configs/services/glance.nix
    ../../configs/services/inadyn.nix
    ../../configs/services/n8n.nix

    #// ../../configs/services/hytale.nix
    #// ../../configs/services/nextcloud.nix
    #// ../../configs/services/minecraft.nix
    #// ../../configs/services/factorio.nix
    #// ../../configs/services/homeassistant.nix
    #// ../../configs/services/hydroxide.nix
    #// ../../configs/services/palworld.nix
  ];

  environment = {
    variables = {
      NH_FLAKE = lib.mkForce "/data/nfs/riaru/Projects/nix-configs";
    };
    sessionVariables = {
      NH_FLAKE = lib.mkForce "/data/nfs/riaru/Projects/nix-configs";
    };
  };

  # Bootloader
  boot.loader.grub = {
    enable = true;
    device = "/dev/sdb";
    useOSProber = true;
  };

  networking.hostName = "kumo";

  system.stateVersion = "24.05";
}
