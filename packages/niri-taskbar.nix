{pkgs ? import <nixpkgs> {}}:
pkgs.rustPlatform.buildRustPackage rec {
  pname = "niri-taskbar";
  version = "0.4.0";
  src = pkgs.fetchFromGitHub {
    owner = "oniX0n";
    repo = "niri-taskbar";
    rev = "main";
    sha256 = "sha256-new3meof7jO3wljTzutdYGXpJTTgchKm/eUbHqU6S9M=";
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
