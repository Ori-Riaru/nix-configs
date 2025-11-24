{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    gsettings-desktop-schemas
  ];

  environment.sessionVariables = {
    XDG_DATA_DIRS = ["${pkgs.gsettings-desktop-schemas}/share/gsettings-schemas/${pkgs.gsettings-desktop-schemas.name}"];
  };
}
