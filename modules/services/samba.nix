# Must add a samba user using smbpasswd -a <your_user>
{...}: {
  services.samba = {
    enable = true;
    securityType = "user";
    openFirewall = true;
    settings = {
      global = {
        "workgroup" = "WORKGROUP";
        "server string" = "Fujin";
        "netbios name" = "fujin";
        "security" = "user";
        "hosts allow" = "192.168.2. 127.0.0.1 localhost 100.";
        "hosts deny" = "0.0.0.0/0";
        "guest account" = "nobody";
        "map to guest" = "bad user";
      };

      "home" = {
        "path" = "/data/shares/home";
        "browseable" = "yes";
        "read only" = "no";
        "guest ok" = "no";
        "create mask" = "0644";
        "directory mask" = "0755";
        "force user" = "smb-user";
        "force group" = "smb-group";
      };
      
      "bulk" = {
        "path" = "/data/shares/bulk";
        "browseable" = "yes";
        "read only" = "no";
        "guest ok" = "no";
        "create mask" = "0644";
        "directory mask" = "0755";
        "force user" = "smb-user";
        "force group" = "smb-group";
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
  users.groups.smb-group = {};
  users.users.smb-user = {
    isSystemUser = true;
    group = "smb-group";
  };

  # Create share directories
  systemd.tmpfiles.rules = [
    "d /data/shares 0775 root root -"
    "d /data/shares/home 0775 smb-user smb-group -"
    "d /data/shares/bulk 0775 smb-user smb-group -"
  ];
}
