{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  kdePackages,
  zip,
}:
stdenvNoCC.mkDerivation (finalAttrs: {
  pname = "simple-kickoff";
  version = "2.5";

  src = fetchFromGitHub {
    owner = "Damglador";
    repo = "Simple-Kickoff-for-Plasma";
    rev = "patch-1";
    hash = "sha256-+eCpU9xkl6tYoYNPfGb4nZFz1I4JPLNINBK3rhPn+lQ=";
  };

  nativeBuildInputs = [zip];

  installPhase = ''
    runHook preInstall

    mkdir -p $out/share/plasma/plasmoids/org.kde.plasma.simplekickoff
    cp -r contents/ $out/share/plasma/plasmoids/org.kde.plasma.simplekickoff
    cp metadata.desktop $out/share/plasma/plasmoids/org.kde.plasma.simplekickoff
    cp metadata.json $out/share/plasma/plasmoids/org.kde.plasma.simplekickoff
    cp LICENSE.md $out/share/plasma/plasmoids/org.kde.plasma.simplekickoff

    runHook postInstall
  '';

  meta = {
    description = "This is a simplified fork of Kickoff which is KDE Plasma Desktop's default Application launcher. The design is minimalized without compromising on power and important features.";
    homepage = "https://github.com/HimDek/Simple-Kickoff-for-Plasma";
    changelog = "https://github.com/HimDek/Simple-Kickoff-for-Plasma/releases/tag/${finalAttrs.version}";
    license = lib.licenses.gpl2;
    maintainers = with lib.maintainers; [AkiRiaru];
    inherit (kdePackages.kwindowsystem.meta) platforms;
  };
})
