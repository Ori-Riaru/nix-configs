{pkgs, ...}: {
  home.packages = with pkgs; [
    thunderbird
    hydroxide
  ];
}
