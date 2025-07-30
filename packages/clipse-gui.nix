{
  lib,
  stdenv,
  fetchFromGitHub,
  python3,
  gtk3,
  gobject-introspection,
  wrapGAppsHook3,
  wl-clipboard,
  clipse,
  xclip,
  wtype,
  xdotool,
  makeDesktopItem,
  copyDesktopItems,
}:
python3.pkgs.buildPythonApplication rec {
  pname = "clipse-gui";
  version = "0.1.4";
  pyproject = false;

  src = fetchFromGitHub {
    owner = "d7omdev";
    repo = "clipse-gui";
    rev = "v${version}";
    hash = "sha256-bh5QlmQUJ0qGVOGsWW0j3zvnYvAR9flfYXsG+6d0fso=";
  };

  nativeBuildInputs = [
    wrapGAppsHook3
    gobject-introspection
    copyDesktopItems
  ];

  buildInputs = [
    gtk3
  ];

  propagatedBuildInputs = with python3.pkgs; [
    pygobject3
  ];

  # Runtime dependencies for clipboard operations
  makeWrapperArgs = [
    "--prefix PATH : ${lib.makeBinPath [
      wl-clipboard
      xclip
      wtype
      xdotool
      clipse
    ]}"
  ];

  dontBuild = true;

  installPhase = ''
    runHook preInstall

    # Create the Python site-packages directory
    mkdir -p $out/${python3.sitePackages}
    cp -r clipse_gui $out/${python3.sitePackages}/

    # Install the main script
    install -Dm755 clipse-gui.py $out/bin/clipse-gui
    install -Dm644 clipse-gui.png $out/share/pixmaps/clipse-gui.png

    runHook postInstall
  '';

  desktopItems = [
    (makeDesktopItem {
      name = "clipse-gui";
      exec = "clipse-gui";
      icon = "clipse-gui";
      desktopName = "Clipse GUI";
      genericName = "Clipboard Manager";
      comment = "A GTK3 graphical user interface for the clipse clipboard manager";
      categories = ["Utility" "Office"];
      startupNotify = true;
      keywords = ["clipboard" "history" "clipse" "clip" "paste"];
    })
  ];

  doCheck = false;

  meta = with lib; {
    description = "A GTK3 graphical user interface for the clipse clipboard manager";
    longDescription = ''
      A GTK3 graphical user interface for the excellent clipse command-line
      clipboard manager. This GUI provides a visual way to browse, search, pin,
      preview, and copy items from your clipse clipboard history.
    '';
    homepage = "https://github.com/d7omdev/clipse-gui";
    license = licenses.mit;
    maintainers = with maintainers; [Ori-Riaru];
    platforms = platforms.linux;
    mainProgram = "clipse-gui";
  };
}
