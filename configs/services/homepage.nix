{
  services.homepage-dashboard = {
    enable = true;
    listenPort = 3000;

    # Enable search functionality
    settings = {
      title = "Dashboard";
      background = "https://images.unsplash.com/photo-1502134249126-9f3755a50d78";
      cardBlur = "md";
      theme = "dark";
      color = "slate";

      # Configure search providers
      search = {
        provider = "duckduckgo";
        target = "_blank";
      };
    };

    widgets = [
      {
        search = {
          provider = "google";
          target = "_blank";
          showSearchSuggestions = true;
        };
      }
      {
        youtube = {
          key = "AIzaSyBsm1-nFUUOcjQR6DHGbIX5V9ZgOwJAbY8";
          channelId = "UCqTZjX7VYWcVFI5f5gij9QA";
          embedLimit = 6;
          showThumbnails = true;
          showChannelName = true;
          showUploadDate = true;
        };
      }
      {
        resources = {
          cpu = true;
          memory = true;
          disk = "/";
        };
      }
    ];

    # Configure services/bookmarks
    services = [
      {
        "Media" = [
          {
            "YouTube" = {
              href = "https://youtube.com";
              description = "Video platform";
              icon = "youtube.svg";
            };
          }
        ];
      }
      {
        "Self-Hosted" = [
          # Add your self-hosted services here
        ];
      }
    ];

    # Configure bookmarks
    bookmarks = [
      {
        "Development" = [
          {
            "GitHub" = [
              {
                abbr = "GH";
                href = "https://github.com";
              }
            ];
          }
        ];
      }
    ];
  };
}
