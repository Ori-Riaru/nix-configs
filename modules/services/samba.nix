{...}: {
  services.samba = {
    enable = true;
    securityType = "user";
    openFirewall = true;
    settings = {
      global = {
        "workgroup" = "WORKGROUP";
        "server string" = "My NixOS Server";
        "netbios name" = "nixos-server";
        "security" = "user";
        # Allow access from your local network - adjust IP range as needed
        "hosts allow" = "192.168.2. 127.0.0.1 localhost";
        "hosts deny" = "0.0.0.0/0";
        "guest account" = "nobody";
        "map to guest" = "bad user";
      };
      # Public share accessible by guests
      "public" = {
        "path" = "/srv/samba/public";
        "browseable" = "yes";
        "read only" = "no";
        "guest ok" = "yes";
        "create mask" = "0644";
        "directory mask" = "0755";
        "force user" = "samba-user";
        "force group" = "samba-group";
      };
      # Private share requiring authentication
      "private" = {
        "path" = "/srv/samba/private";
        "browseable" = "yes";
        "read only" = "no";
        "guest ok" = "no";
        "create mask" = "0644";
        "directory mask" = "0755";
        "force user" = "samba-user";
        "force group" = "samba-group";
      };
    };
  };

  # Enable Windows discovery service
  services.samba-wsdd = {
    enable = true;
    openFirewall = true;
  };

  # Ensure firewall is properly configured
  networking.firewall.enable = true;
  networking.firewall.allowPing = true;

  # Create samba user and group
  users.groups.samba-group = {};
  users.users.samba-user = {
    isSystemUser = true;
    group = "samba-group";
  };

  # Create share directories
  systemd.tmpfiles.rules = [
    "d /srv/samba 0755 root root -"
    "d /srv/samba/public 0755 samba-user samba-group -"
    "d /srv/samba/private 0755 samba-user samba-group -"
  ];
}
