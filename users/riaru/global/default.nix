{
  inputs,
  outputs,
  settings,
  ...
}: {
  nixpkgs = {
    overlays = [
      inputs.nur.overlays.default
      # Add overlays your own flake exports (from overlays and pkgs dir):
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.stable-packages
    ];

    config = {
      allowUnfree = true;
    };
  };

  home = {
    username = "${settings.username}";
    homeDirectory = "/home/${settings.username}";
  };

  # Create none standard default folders
  home.file = {
    "Captures/.keep".text = "";
    "Games/.keep".text = "";
    "Notes/.keep".text = "";
    "Projects/.keep".text = "";
    "Temp/.keep".text = "";
  };

  programs.home-manager.enable = true;
  programs.git.enable = true;

  systemd.user.startServices = "sd-switch";
}
