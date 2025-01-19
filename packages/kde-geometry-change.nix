{ stdenv
, fetchFromGitHub
, lib
}:

stdenv.mkDerivation rec {
  pname = "kde-geometry-change";
  version = "1.3";
  
  src = fetchFromGitHub {
    owner = "peterfajdiga";
    repo = "kwin4_effect_geometry_change";
    rev = "v${version}";
    hash = "sha256-H3cslx6ceAJGXSa0+gNzmUINRoLeYODhGt4pSFfgNbQ=";
  };

  dontBuild = true;

  installPhase = ''
    runHook preInstall

    mkdir -p $out/share/kwin/effects/kwin4_effect_geometry_change/
    cp -r package/* $out/share/kwin/effects/kwin4_effect_geometry_change/

    runHook postInstall
  '';

  LANG = "C.UTF-8";

  meta = with lib; {
    description = "A KWin animation for windows moved or resized by programs or scripts";
    homepage = "https://github.com/peterfajdiga/kwin4_effect_geometry_change";
    license = licenses.gpl3Only;
    maintainers = with maintainers; [ AkiRiaru  ];
    platforms = platforms.linux;
  };
}