{...}:{
  services.dashy = {
    enable = true;

    virtualHost = {
      enableNginx = true;
      domain = "localhost";
    };

    settings = {
      appConfig = {
        theme = "default";
        layout = "auto";
        iconSize = "medium";
        language = "en";
        enableFontAwesome = true;
      };

      pageInfo = {
        title = "My Dashboard";
        description = "A minimal Dashy setup on NixOS";
        navLinks = [
          {
            title = "Home";
            path = "/";
          }
        ];
      };

      sections = [
        {
          name = "Getting Started";
          items = [
            {
              title = "Dashy Documentation";
              description = "Learn more about Dashy configuration";
              icon = "fas fa-book";
              url = "https://dashy.to/docs/";
              target = "newtab";
            }
            {
              title = "NixOS Manual";
              description = "NixOS system documentation";
              icon = "fas fa-cog";
              url = "https://nixos.org/manual/nixos/stable/";
              target = "newtab";
            }
          ];
        }
        {
          name = "Local Services";
          items = [
            {
              title = "Router Admin";
              description = "Local router interface";
              icon = "fas fa-wifi";
              url = "http://192.168.1.254";
              target = "newtab";
            }
            {
              title = "System Monitor";
              description = "Check system resources";
              icon = "fas fa-chart-line";
              url = "http://localhost:19999"; # Netdata default port
              target = "newtab";
            }
          ];
        }
      ];
    };
  };
}