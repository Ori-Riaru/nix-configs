{pkgs, ...}: {
  # home.packages = with pkgs; [
  #   (discord.override {
  #     withVencord = true;
  #     withOpenASAR = true;
  #   })
  # ];

  # Switched to Vesktop because of https://github.com/NixOS/nixpkgs/issues/195512
  programs.vesktop.enable = true;
}
