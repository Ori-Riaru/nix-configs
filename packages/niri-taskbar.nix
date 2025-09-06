{pkgs ? import <nixpkgs> {}}:
pkgs.rustPlatform.buildRustPackage rec {
  pname = "niri-taskbar";
  version = "0.3.0";
  src = pkgs.fetchFromGitHub {
    owner = "LawnGnome";
    repo = "niri-taskbar";
    rev = "v${version}+niri.25.08";
    sha256 = "sha256-Gbzh4OTkvtP9F/bfDUyA14NH2DMDdr3i6oFoFwinEAg=";
  };
  cargoLock.lockFile = src + "/Cargo.lock";

  nativeBuildInputs = [
    pkgs.pkg-config
  ];

  buildInputs = [
    pkgs.gtk3
  ];

  meta = with pkgs.lib; {
    description = "Waybar taskbar module for Niri";
    homepage = "https://github.com/LawnGnome/niri-taskbar";
    license = licenses.mit;
    maintainers = [];
    platforms = platforms.linux;
  };
}
