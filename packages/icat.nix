{
  stdenv,
  fetchFromGitHub,
  imlib2,
  xorg,
}:
stdenv.mkDerivation rec {
  pname = "icat";
  version = "0.5";
  src = fetchFromGitHub {
    owner = "atextor";
    repo = "icat";
    rev = "v${version}";
    hash = "sha256-aiLPVdKSppT/PWPW0Ue475WG61pBLh8OtLuk2/UU3nM=";
  };

  buildInputs = [
    imlib2
    xorg.libX11
  ];

  installPhase = ''
    runHook preInstall
    mkdir -p $out/bin
    cp icat $out/bin
    runHook postInstall
  '';
}
