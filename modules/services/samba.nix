# Must add a samba user using smbpasswd -p a <your_user>
{...}: {
  users.groups.smb-group = {};
  users.users.smb-user = {
    isSystemUser = true;
    group = "smb-group";
  };

  systemd.tmpfiles.rules = [
    "d /data/smb 0775 root root -"
    "d /data/smb/riaru 0775 smb-user smb-group -"
  ];

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

      "riaru" = {
        "path" = "/data/smb/riaru";
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
}