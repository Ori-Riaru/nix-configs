{pkgs, ...}: {
  home.packages = with pkgs; [
    speedtest-go
  ];
}
