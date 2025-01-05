{pkgs, ...}: {
  home.packages = with pkgs; [
    # Onscreen keyboard
    maliit-keyboard
    maliit-framework
  ];
}
