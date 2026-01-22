{pkgs, ...}: {
  networking.networkmanager.enable = true;
  # Fixes issues with NTP port being blocked on university networks https://nixos.wiki/wiki/NTP
  networking.networkmanager.dispatcherScripts = [
    {
      source = pkgs.writeText "10-update-timesyncd" ''
        [ -z "$CONNECTION_UUID" ] && exit 0
        INTERFACE="$1"
        ACTION="$2"
        case $ACTION in
        up | dhcp4-change | dhcp6-change)
          systemctl restart systemd-timesyncd.service
          if [ -n "$DHCP4_NTP_SERVERS" ]; then
            echo "Will add the ntp server $DHCP4_NTP_SERVERS"
          else
            echo "No DHCP4 NTP available."
            exit 0
          fi
          mkdir -p /etc/systemd/timesyncd.conf.d
          echo "[Time]" > "/etc/systemd/timesyncd.conf.d/''${CONNECTION_UUID}.conf"
          echo "NTP=$DHCP4_NTP_SERVERS" >> "/etc/systemd/timesyncd.conf.d/''${CONNECTION_UUID}.conf"
          systemctl restart systemd-timesyncd.service
          ;;
        down)
          rm -f "/etc/systemd/timesyncd.conf.d/''${CONNECTION_UUID}.conf"
          systemctl restart systemd-timesyncd.service
          ;;
        esac
        echo 'Done!'
      '';
    }
  ];
}
