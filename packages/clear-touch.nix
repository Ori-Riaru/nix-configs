{
  lib,
  stdenv,
  fetchFromGitHub,
  zig_0_9,
  libglfw,
  libXi,
  libXinerama,
  libXrandr,
  libXcursor,
}:
stdenv.mkDerivation rec {
  pname = "cleartouch";
  version = "unstable-2025-03-10";

  src = fetchFromGitHub {
    owner = "canadaduane";
    repo = "cleartouch";
    rev = "master";
    fetchSubmodules = true;
    sha256 = "0000000000000000000000000000000000000000000000"; # Replace with actual hash
  };

  nativeBuildInputs = [
    zig_0_9
  ];

  buildInputs = [
    libglfw
    libXi
    libXinerama
    libXrandr
    libXcursor
  ];

  buildPhase = ''
    zig build
  '';

  installPhase = ''
    mkdir -p $out/bin
    cp ./zig-out/bin/cleartouch $out/bin/
  '';

  meta = with lib; {
    description = "A touchpad input manipulation tool";
    homepage = "https://github.com/canadaduane/cleartouch";
    license = licenses.mit; # Update if the actual license is different
    platforms = platforms.linux;
    maintainers = [OriRiaru]; # Add your name if you want
  };
}
