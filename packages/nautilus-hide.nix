{
  stdenv,
  lib,
  fetchFromGitHub,
  meson,
  ninja,
  pkg-config,
  glib,
  gtk4,
  libadwaita,
  nautilus-python,
  python3,
  gettext,
}:
stdenv.mkDerivation rec {
  pname = "nautilus-hide";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "nautilus-extensions";
    repo = "nautilus-hide";
    rev = "main";
    sha256 = "sha256-cI+8c1jzxuUGfot4u7Pw2EJNAm/jgzMOHly/7MJXGKo=";
  };

  nativeBuildInputs = [
    meson
    ninja
    pkg-config
    gettext
  ];

  buildInputs = [
    glib
    gtk4
    libadwaita
    nautilus-python
    python3
    python3.pkgs.pygobject3
  ];

  postInstall = ''
    # Move extension from meson's default location to nautilus-python extensions directory
    mkdir -p $out/share/nautilus-python/extensions
    if [ -d $out/nautilus-python/extensions ]; then
      mv $out/nautilus-python/extensions/* $out/share/nautilus-python/extensions/
      rmdir $out/nautilus-python/extensions
      rmdir $out/nautilus-python
    fi
  '';

  meta = with lib; {
    description = "Nautilus extension to hide/show files without renaming them";
    longDescription = ''
      A simple Nautilus extension that adds the ability to hide/show files
      without renaming them (i.e., without prefixing a dot). This can be
      useful for temporarily hiding files from view.
    '';
    homepage = "https://github.com/nautilus-extensions/nautilus-hide";
    license = licenses.gpl3Plus;
    platforms = platforms.linux;
    maintainers = with maintainers; [Ori-Riaru];
  };
}
