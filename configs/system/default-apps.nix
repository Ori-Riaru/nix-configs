{
  xdg = {
    enable = true;
    mime.enable = true;
    mimeApps = let
      browser = "vivaldi-stable.desktop";
      terminal = "ghostty.desktop";

      file-explorer = "org.gnome.Nautilus.desktop";
      audio-player = "io.bassi.Amberol.desktop";
      video-player = "org.gnome.Showtime.desktop";
      image-viewer = "org.gnome.Loupe.desktop";
      model-viewer = "f3d.desktop";

      text-editor = "dev.zed.Zed.desktop";
      doc-editor = "libreoffice-writer.desktop";
      sheet-editor = "libreoffice-calc.desktop";
      presentation-editor = "libreoffice-impress.desktop";
      drawing-editor = "libreoffice-draw.desktop";
      model-editor = "blender.desktop";
    in {
      enable = true;
      defaultApplications = {
        # === Web ===
        "text/html" = browser;
        "x-scheme-handler/http" = browser;
        "x-scheme-handler/https" = browser;
        "x-scheme-handler/about" = browser;
        "x-scheme-handler/unknown" = browser;
        "x-scheme-handler/chrome" = browser;
        "application/xhtml+xml" = browser;
        "application/x-extension-htm" = browser;
        "application/x-extension-html" = browser;
        "application/x-extension-xhtml" = browser;

        # === Text / Code ===
        "application/x-empty" = text-editor;
        "inode/x-empty" = text-editor;
        "text/plain" = text-editor;
        "text/markdown" = text-editor;
        "text/x-markdown" = text-editor;
        "application/x-markdown" = text-editor;
        "text/x-c" = text-editor;
        "text/x-chdr" = text-editor;
        "text/x-c++src" = text-editor;
        "text/x-c++hdr" = text-editor;
        "text/x-python" = text-editor;
        "text/x-java" = text-editor;
        "text/x-javascript" = text-editor;
        "application/javascript" = text-editor;
        "application/json" = text-editor;
        "application/xml" = text-editor;
        "text/xml" = text-editor;
        "text/css" = text-editor;
        "text/x-yaml" = text-editor;
        "text/x-toml" = text-editor;
        "text/x-nix" = text-editor;
        "text/x-shellscript" = text-editor;
        "text/x-lua" = text-editor;
        "text/x-rust" = text-editor;
        "text/x-go" = text-editor;
        "application/x-ruby" = text-editor;
        "text/x-csharp" = text-editor;
        "text/x-diff" = text-editor;
        "text/x-patch" = text-editor;
        "text/x-makefile" = text-editor;
        "text/x-cmake" = text-editor;
        "text/x-sql" = text-editor;
        "application/sql" = text-editor;
        "text/x-typescript" = text-editor;
        "application/x-php" = text-editor;
        "text/x-php" = text-editor;
        "text/x-haskell" = text-editor;
        "text/x-scala" = text-editor;
        "text/x-dockerfile" = text-editor;
        "application/x-desktop" = text-editor;
        "text/x-log" = text-editor;
        "application/toml" = text-editor;
        "application/x-yaml" = text-editor;
        "application/octet-stream" = text-editor;

        # === Document ===
        "application/pdf" = browser;
        "application/vnd.oasis.opendocument.text" = doc-editor;
        "application/vnd.oasis.opendocument.spreadsheet" = sheet-editor;
        "application/vnd.oasis.opendocument.presentation" = presentation-editor;
        "application/vnd.oasis.opendocument.graphics" = drawing-editor;
        "application/msword" = doc-editor;
        "application/vnd.ms-excel" = sheet-editor;
        "application/vnd.ms-powerpoint" = presentation-editor;
        "application/vnd.openxmlformats-officedocument.wordprocessingml.document" = doc-editor;
        "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" = sheet-editor;
        "application/vnd.openxmlformats-officedocument.presentationml.presentation" = presentation-editor;
        "application/rtf" = doc-editor;
        "text/csv" = sheet-editor;
        "text/tab-separated-values" = sheet-editor;

        # === Application ===
        "application/x-terminal-emulator" = terminal;
        "x-scheme-handler/terminal" = terminal;
        "inode/directory" = file-explorer;

        # === Images ===
        "image/jpeg" = image-viewer;
        "image/jpg" = image-viewer;
        "image/png" = image-viewer;
        "image/gif" = image-viewer;
        "image/bmp" = image-viewer;
        "image/tiff" = image-viewer;
        "image/webp" = image-viewer;
        "image/svg+xml" = image-viewer;
        "image/x-png" = image-viewer;
        "image/avif" = image-viewer;
        "image/heic" = image-viewer;
        "image/heif" = image-viewer;
        "image/jxl" = image-viewer;
        "image/vnd.microsoft.icon" = image-viewer;
        "image/x-icon" = image-viewer;
        "image/x-tga" = image-viewer;

        # === Audio ===
        "audio/mpeg" = audio-player;
        "audio/mp3" = audio-player;
        "audio/wav" = audio-player;
        "audio/flac" = audio-player;
        "audio/ogg" = audio-player;
        "audio/aac" = audio-player;
        "audio/x-wav" = audio-player;
        "audio/x-flac" = audio-player;
        "audio/x-vorbis+ogg" = audio-player;
        "audio/x-opus+ogg" = audio-player;
        "audio/mp4" = audio-player;
        "audio/x-m4a" = audio-player;
        "audio/x-aiff" = audio-player;
        "audio/x-ape" = audio-player;
        "audio/webm" = audio-player;
        "audio/opus" = audio-player;

        # === Video ===
        "video/mp4" = video-player;
        "video/x-msvideo" = video-player;
        "video/quicktime" = video-player;
        "video/x-matroska" = video-player;
        "video/webm" = video-player;
        "video/ogg" = video-player;
        "video/x-flv" = video-player;
        "video/x-ms-wmv" = video-player;
        "application/x-matroska" = video-player;
        "video/3gpp" = video-player;
        "video/3gpp2" = video-player;
        "video/mp2t" = video-player;
        "video/vnd.avi" = video-player;

        # === 3D ===
        "application/x-blender" = model-editor;
        "model/gltf+json" = model-viewer;
        "model/gltf-binary" = model-viewer;
        "model/obj" = model-viewer;
        "model/stl" = model-viewer;
        "model/ply" = model-viewer;
        "model/x3d+xml" = model-viewer;
        "application/x-tgif" = model-viewer;
        "application/x-fbx" = model-viewer;

        # === Archives ===
        "application/zip" = file-explorer;
        "application/x-tar" = file-explorer;
        "application/gzip" = file-explorer;
        "application/x-bzip2" = file-explorer;
        "application/x-xz" = file-explorer;
        "application/x-7z-compressed" = file-explorer;
        "application/x-rar-compressed" = file-explorer;
        "application/x-compressed-tar" = file-explorer;
        "application/x-bzip-compressed-tar" = file-explorer;
        "application/x-xz-compressed-tar" = file-explorer;
        "application/zstd" = file-explorer;
        "application/x-zstd-compressed-tar" = file-explorer;
        "application/epub+zip" = browser;
      };
    };
  };
}
