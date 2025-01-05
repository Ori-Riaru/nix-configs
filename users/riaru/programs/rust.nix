{pkgs, ...}: {
  home.packages = with pkgs; [
    rustc
    cargo
    rustfmt
    rust-analyzer
    clippy 
  ];
}
