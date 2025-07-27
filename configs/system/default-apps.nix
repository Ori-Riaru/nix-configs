{
  xdg = {
    enable = true;
    mimeApps = {
      enable = true;
      defaultApplications = {
        # Web 
        "text/html" = "firefox.desktop";
        "x-scheme-handler/http" = "firefox.desktop";
        "x-scheme-handler/https" = "firefox.desktop";
        "x-scheme-handler/about" = "firefox.desktop";
        "x-scheme-handler/unknown" = "firefox.desktop";
        "application/xhtml+xml" = "firefox.desktop";

        # Text files and code - VSCodium
        "text/plain" = "codium.desktop";
        "text/x-c" = "codium.desktop";
        "text/x-c++src" = "codium.desktop";
        "text/x-python" = "codium.desktop";
        "text/x-java" = "codium.desktop";
        "text/x-javascript" = "codium.desktop";
        "application/json" = "codium.desktop";
        "application/xml" = "codium.desktop";
        "text/css" = "codium.desktop";
        "text/x-yaml" = "codium.desktop";
        "text/x-toml" = "codium.desktop";
        "text/x-nix" = "codium.desktop";
        "text/x-shellscript" = "codium.desktop";
        "text/x-lua" = "codium.desktop";
        "text/x-rust" = "codium.desktop";
        "text/x-go" = "codium.desktop";
        "application/x-ruby" = "codium.desktop";

        # Terminal - Kitty
        "application/x-terminal-emulator" = "kitty.desktop";

        # 3D 
        "application/x-blender" = "blender.desktop";
        "model/gltf+json" = "f3d.desktop";
        "model/gltf-binary" = "f3d.desktop";
        "model/obj" = "f3d.desktop";
        "model/stl" = "f3d.desktop";
        "model/ply" = "f3d.desktop";
        "model/x3d+xml" = "f3d.desktop";
        "application/x-tgif" = "f3d.desktop";

        # Office 
        "application/vnd.oasis.opendocument.text" = "libreoffice-writer.desktop";
        "application/vnd.oasis.opendocument.spreadsheet" = "libreoffice-calc.desktop";
        "application/vnd.oasis.opendocument.presentation" = "libreoffice-impress.desktop";
        "application/msword" = "libreoffice-writer.desktop";
        "application/vnd.ms-excel" = "libreoffice-calc.desktop";
        "application/vnd.ms-powerpoint" = "libreoffice-impress.desktop";
        "application/vnd.openxmlformats-officedocument.wordprocessingml.document" = "libreoffice-writer.desktop";
        "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" = "libreoffice-calc.desktop";
        "application/vnd.openxmlformats-officedocument.presentationml.presentation" = "libreoffice-impress.desktop";
        "application/rtf" = "libreoffice-writer.desktop";
        "text/csv" = "libreoffice-calc.desktop";

        # File manager 
        "inode/directory" = "org.gnome.Nautilus.desktop";

        # Markdown and notes 
        "text/markdown" = "md.obsidian.Obsidian.desktop";
        "text/x-markdown" = "md.obsidian.Obsidian.desktop";

        # Images 
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

        # Audio files 
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

        # Video 
        "video/mp4" = "dragon.desktop";
        "video/x-msvideo" = "dragon.desktop";
        "video/quicktime" = "dragon.desktop";
        "video/x-matroska" = "dragon.desktop";
        "video/webm" = "dragon.desktop";
        "video/ogg" = "dragon.desktop";
        "video/x-flv" = "dragon.desktop";
        "video/x-ms-wmv" = "dragon.desktop";
        "application/x-matroska" = "dragon.desktop";

        # PDFs
        "application/pdf" = "firefox.desktop";

        # Archives - Nautilus (GNOME Files can handle basic archives)
        "application/zip" = "org.gnome.Nautilus.desktop";
        "application/x-tar" = "org.gnome.Nautilus.desktop";
        "application/gzip" = "org.gnome.Nautilus.desktop";
        "application/x-bzip2" = "org.gnome.Nautilus.desktop";
        "application/x-xz" = "org.gnome.Nautilus.desktop";
        "application/x-7z-compressed" = "org.gnome.Nautilus.desktop";
        "application/x-rar-compressed" = "org.gnome.Nautilus.desktop";
      };
    };
  };
}
