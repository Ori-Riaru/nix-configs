{
  xdg = {
    enable = true;
    mimeApps = {
      enable = true;
      defaultApplications = {
        # === Web ===
        "text/html" = "vivaldi-stable.desktop";
        "x-scheme-handler/http" = "vivaldi-stable.desktop";
        "x-scheme-handler/https" = "vivaldi-stable.desktop";
        "x-scheme-handler/about" = "vivaldi-stable.desktop";
        "x-scheme-handler/unknown" = "vivaldi-stable.desktop";
        "x-scheme-handler/chrome" = "vivaldi-stable.desktop";
        "application/xhtml+xml" = "vivaldi-stable.desktop";
        "application/x-extension-htm" = "vivaldi-stable.desktop";
        "application/x-extension-html" = "vivaldi-stable.desktop";
        "application/x-extension-xhtml" = "vivaldi-stable.desktop";

        # === Text / Code ===
        "text/plain" = "codium.desktop";
        "text/markdown" = "obsidian.desktop";
        "text/x-markdown" = "obsidian.desktop";
        "application/x-markdown" = "obsidian.desktop";
        "text/x-c" = "codium.desktop";
        "text/x-chdr" = "codium.desktop";
        "text/x-c++src" = "codium.desktop";
        "text/x-c++hdr" = "codium.desktop";
        "text/x-python" = "codium.desktop";
        "text/x-java" = "codium.desktop";
        "text/x-javascript" = "codium.desktop";
        "application/javascript" = "codium.desktop";
        "application/json" = "codium.desktop";
        "application/xml" = "codium.desktop";
        "text/xml" = "codium.desktop";
        "text/css" = "codium.desktop";
        "text/x-yaml" = "codium.desktop";
        "text/x-toml" = "codium.desktop";
        "text/x-nix" = "codium.desktop";
        "text/x-shellscript" = "codium.desktop";
        "text/x-lua" = "codium.desktop";
        "text/x-rust" = "codium.desktop";
        "text/x-go" = "codium.desktop";
        "application/x-ruby" = "codium.desktop";
        "text/x-csharp" = "codium.desktop";
        "text/x-diff" = "codium.desktop";
        "text/x-patch" = "codium.desktop";
        "text/x-makefile" = "codium.desktop";
        "text/x-cmake" = "codium.desktop";
        "text/x-sql" = "codium.desktop";
        "application/sql" = "codium.desktop";
        "text/x-typescript" = "codium.desktop";
        "application/x-php" = "codium.desktop";
        "text/x-php" = "codium.desktop";
        "text/x-haskell" = "codium.desktop";
        "text/x-scala" = "codium.desktop";
        "text/x-dockerfile" = "codium.desktop";
        "application/x-desktop" = "codium.desktop";
        "text/x-log" = "codium.desktop";
        "application/toml" = "codium.desktop";
        "application/x-yaml" = "codium.desktop";

        # === Document ===
        "application/pdf" = "vivaldi-stable.desktop";
        "application/vnd.oasis.opendocument.text" = "libreoffice-writer.desktop";
        "application/vnd.oasis.opendocument.spreadsheet" = "libreoffice-calc.desktop";
        "application/vnd.oasis.opendocument.presentation" = "libreoffice-impress.desktop";
        "application/vnd.oasis.opendocument.graphics" = "libreoffice-draw.desktop";
        "application/msword" = "libreoffice-writer.desktop";
        "application/vnd.ms-excel" = "libreoffice-calc.desktop";
        "application/vnd.ms-powerpoint" = "libreoffice-impress.desktop";
        "application/vnd.openxmlformats-officedocument.wordprocessingml.document" = "libreoffice-writer.desktop";
        "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" = "libreoffice-calc.desktop";
        "application/vnd.openxmlformats-officedocument.presentationml.presentation" = "libreoffice-impress.desktop";
        "application/rtf" = "libreoffice-writer.desktop";
        "text/csv" = "libreoffice-calc.desktop";
        "text/tab-separated-values" = "libreoffice-calc.desktop";

        # === Application ===
        "application/x-terminal-emulator" = "ghostty.desktop";
        "x-scheme-handler/terminal" = "ghostty.desktop";
        "inode/directory" = "org.gnome.Nautilus.desktop";

        # === Images ===
        "image/jpeg" = "org.gnome.Loupe.desktop";
        "image/jpg" = "org.gnome.Loupe.desktop";
        "image/png" = "org.gnome.Loupe.desktop";
        "image/gif" = "org.gnome.Loupe.desktop";
        "image/bmp" = "org.gnome.Loupe.desktop";
        "image/tiff" = "org.gnome.Loupe.desktop";
        "image/webp" = "org.gnome.Loupe.desktop";
        "image/svg+xml" = "org.gnome.Loupe.desktop";
        "image/x-png" = "org.gnome.Loupe.desktop";
        "image/avif" = "org.gnome.Loupe.desktop";
        "image/heic" = "org.gnome.Loupe.desktop";
        "image/heif" = "org.gnome.Loupe.desktop";
        "image/jxl" = "org.gnome.Loupe.desktop";
        "image/vnd.microsoft.icon" = "org.gnome.Loupe.desktop";
        "image/x-icon" = "org.gnome.Loupe.desktop";
        "image/x-tga" = "org.gnome.Loupe.desktop";

        # === Audio ===
        "audio/mpeg" = "io.bassi.Amberol.desktop";
        "audio/mp3" = "io.bassi.Amberol.desktop";
        "audio/wav" = "io.bassi.Amberol.desktop";
        "audio/flac" = "io.bassi.Amberol.desktop";
        "audio/ogg" = "io.bassi.Amberol.desktop";
        "audio/aac" = "io.bassi.Amberol.desktop";
        "audio/x-wav" = "io.bassi.Amberol.desktop";
        "audio/x-flac" = "io.bassi.Amberol.desktop";
        "audio/x-vorbis+ogg" = "io.bassi.Amberol.desktop";
        "audio/x-opus+ogg" = "io.bassi.Amberol.desktop";
        "audio/mp4" = "io.bassi.Amberol.desktop";
        "audio/x-m4a" = "io.bassi.Amberol.desktop";
        "audio/x-aiff" = "io.bassi.Amberol.desktop";
        "audio/x-ape" = "io.bassi.Amberol.desktop";
        "audio/webm" = "io.bassi.Amberol.desktop";
        "audio/opus" = "io.bassi.Amberol.desktop";

        # === Video ===
        "video/mp4" = "org.gnome.Showtime";
        "video/x-msvideo" = "org.gnome.Showtime";
        "video/quicktime" = "org.gnome.Showtime";
        "video/x-matroska" = "org.gnome.Showtime";
        "video/webm" = "org.gnome.Showtime";
        "video/ogg" = "org.gnome.Showtime";
        "video/x-flv" = "org.gnome.Showtime";
        "video/x-ms-wmv" = "org.gnome.Showtime";
        "application/x-matroska" = "org.gnome.Showtime";
        "video/3gpp" = "org.gnome.Showtime";
        "video/3gpp2" = "org.gnome.Showtime";
        "video/mp2t" = "org.gnome.Showtime";
        "video/vnd.avi" = "org.gnome.Showtime";

        # === 3D ===
        "application/x-blender" = "blender.desktop";
        "model/gltf+json" = "f3d.desktop";
        "model/gltf-binary" = "f3d.desktop";
        "model/obj" = "f3d.desktop";
        "model/stl" = "f3d.desktop";
        "model/ply" = "f3d.desktop";
        "model/x3d+xml" = "f3d.desktop";
        "application/x-tgif" = "f3d.desktop";
        "application/x-fbx" = "f3d.desktop";

        # === Archives ===
        "application/zip" = "org.gnome.Nautilus.desktop";
        "application/x-tar" = "org.gnome.Nautilus.desktop";
        "application/gzip" = "org.gnome.Nautilus.desktop";
        "application/x-bzip2" = "org.gnome.Nautilus.desktop";
        "application/x-xz" = "org.gnome.Nautilus.desktop";
        "application/x-7z-compressed" = "org.gnome.Nautilus.desktop";
        "application/x-rar-compressed" = "org.gnome.Nautilus.desktop";
        "application/x-compressed-tar" = "org.gnome.Nautilus.desktop";
        "application/x-bzip-compressed-tar" = "org.gnome.Nautilus.desktop";
        "application/x-xz-compressed-tar" = "org.gnome.Nautilus.desktop";
        "application/zstd" = "org.gnome.Nautilus.desktop";
        "application/x-zstd-compressed-tar" = "org.gnome.Nautilus.desktop";
        "application/epub+zip" = "vivaldi-stable.desktop";

        # === Fallback ===
        "application/octet-stream" = "codium.desktop";
      };
    };
  };
}
