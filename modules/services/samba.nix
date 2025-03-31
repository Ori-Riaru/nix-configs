{
  # Samba configuration
  services.samba = {
    enable = true;
    securityType = "user";
    openFirewall = true;
    settings = {
      global = {
        "workgroup" = "WORKGROUP";
        "server string" = "NixOS NAS";
        "netbios name" = "nixos-nas";
        "security" = "user";
        "use sendfile" = "yes";
        "hosts allow" = "192.168.0. 127.0.0.1 localhost";
        "hosts deny" = "0.0.0.0/0";
        "guest account" = "nobody";
        "map to guest" = "bad user";
        # Performance tuning
        "socket options" = "TCP_NODELAY IPTOS_LOWDELAY SO_RCVBUF=131072 SO_SNDBUF=131072";
        # Disable printer sharing
        "load printers" = "no";
        "printing" = "bsd";
        "printcap name" = "/dev/null";
        "disable spoolss" = "yes";
        # Logging
        "log file" = "/var/log/samba/log.%m";
        "max log size" = "50";
      };
      "public" = {
        "path" = "/mnt/Shares/Public";
        "browseable" = "yes";
        "read only" = "no";
        "guest ok" = "yes";
        "create mask" = "0644";
        "directory mask" = "0755";
        "force user" = "nas-user"; # Replace with your actual username
        "force group" = "users"; # Replace with your actual group
      };
      "private" = {
        "path" = "/mnt/Shares/Private";
        "browseable" = "yes";
        "read only" = "no";
        "guest ok" = "no";
        "create mask" = "0644";
        "directory mask" = "0755";
        "force user" = "nas-user"; # Replace with your actual username
        "force group" = "users"; # Replace with your actual group
        "valid users" = "@users"; # Only users in the 'users' group can access
      };
    };
  };

  services.samba-wsdd = {
    enable = true;
    openFirewall = true;
  };

  # Firewall configuration
  networking.firewall.enable = true;
  networking.firewall.allowPing = true;

  users.users.nas-user = {
    isNormalUser = true;
    description = "NAS User";
    extraGroups = ["users"];
  };
}
