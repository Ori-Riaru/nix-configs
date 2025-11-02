{
  pkgs,
  settings,
  config,
  ...
}: {
  home.packages = with pkgs; [
    waybar
    pavucontrol
    jq # needed for the kanata layer script
    python3Packages.python-kasa
  ];

  services.network-manager-applet.enable = true;
  home.file.".config/waybar/scripts/kanata-layer.sh" = {
    text = ''
      #!${pkgs.bash}/bin/bash
      # Script to get current Kanata layer via TCP

      KANATA_PORT=8008  # adjust if your port is different
      KANATA_HOST="localhost"

      # Try to get the current layer
      response=$(echo "layer" | timeout 2 nc -w 1 $KANATA_HOST $KANATA_PORT 2>/dev/null | tr -d '\n\r')

      if [ -z "$response" ] || [ "$response" = "" ]; then
        echo '{"text": "   N/A", "tooltip": "Kanata not connected", "class": "disconnected"}'
        exit 0
      fi

      # Try to parse JSON response to extract layer name
      layer=$(echo "$response" | jq -r '.LayerChange.new // empty' 2>/dev/null)

      # If jq parsing fails or returns empty, try to extract layer name manually
      if [ -z "$layer" ] || [ "$layer" = "null" ]; then
        # Fallback: try to extract layer name from JSON-like string
        layer=$(echo "$response" | sed -n 's/.*"new":"\([^"]*\)".*/\1/p')
      fi

      # If still empty, use the raw response (might be just a plain layer name)
      if [ -z "$layer" ]; then
        layer="$response"
      fi

      # Escape any remaining quotes in the layer name
      layer=$(echo "$layer" | sed 's/"/\\"/g')

      if [ -n "$layer" ] && [ "$layer" != "" ]; then
        echo "{\"text\": \"   $layer\", \"tooltip\": \"Current Kanata layer: $layer\", \"class\": \"connected\"}"
      else
        echo '{"text": "  N/A", "tooltip": "Kanata response unparseable", "class": "disconnected"}'
      fi
    '';
    executable = true;
  };

  programs.waybar = {
    enable = true;
    systemd.enable = true;
    style = builtins.readFile ./style.css;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 8;
        margin-top = settings.gap;
        margin-left = settings.gap;
        margin-right = settings.gap;
        margin-bottom = 0;
        output = [
          "eDP-1"
          "HDMI-A-1"
          "DP-2"
        ];

        modules-left = ["clock"];
        modules-center = ["niri/workspaces" "cffi/niri-taskbar" "custom/application-launcher"];
        modules-right = ["custom/kasa" "custom/kanata-layer" "battery" "pulseaudio" "tray"]; # Added kanata-layer here

        "clock" = {
          "interval" = 60;
          "align" = 0;
          "rotate" = 0;
          "timezone" = "America/Toronto";
          "tooltip-format" = "<big>{:%B %Y}</big>\n<tt><big>{calendar}</big></tt>";
          "format" = "{:%H:%M}";
          "format-alt" = " {:%a %b %d, %G}";
        };

        "custom/application-launcher" = {
          "format" = " + ";
          "on-click" = "walker";
        };

        "custom/kanata-layer" = {
          "format" = "{}";
          "return-type" = "json";
          "exec" = "$HOME/.config/waybar/scripts/kanata-layer.sh";
          "interval" = 1;
          "tooltip" = true;
          "on-click" = "";
        };

        "cffi/niri-taskbar" = {
          "module_path" = "${pkgs.niri-taskbar}/lib/libniri_taskbar.so";
          "icon-size" = 10;
        };

        "pulseaudio" = {
          "format" = "{icon}  {volume}%";
          "format-bluetooth" = "{icon}  {volume}%";
          "format-muted" = "";
          "format-icons" = {
            "alsa_output.pci-0000_00_1f.3.analog-stereo" = "";
            "alsa_output.pci-0000_00_1f.3.analog-stereo-muted" = "";
            "headphones" = "";
            "handsfree" = "";
            "headset" = "";
            "phone" = "";
            "phone-muted" = "";
            "portable" = "";
            "car" = "";
            "default" = ["" ""];
          };
          "scroll-step" = 1;
          "on-click" = "pavucontrol";
        };

        "custom/kasa" = {
          "format" = "💡";
          "on-click" = "kasa --host 192.168.1.72 --username 'ori-riaru@proton.me' --password $(cat ${config.sops.secrets.kasa_pass.path}) toggle";
          "tooltip" = false;
        };
      };
    };
  };
}
