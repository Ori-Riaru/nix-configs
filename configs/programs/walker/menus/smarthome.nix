{
  pkgs,
  settings,
  config,
  ...
}: {
  programs.elephant.provider.menus.toml.smarthome = {
    name = "smarthome";
    name_pretty = "Smart Home";
    icon = "";
    entries = [
      {
        text = "Toggle Lights";
        icon = "";
        actions = {"Toggle lights" = "${pkgs.python314Packages.python-kasa}/bin/kasa --host ${settings.kasaIP} --username '${settings.email}' --password $(cat ${config.sops.secrets.kasa_pass.path}) toggle";};
      }
    ];
  };
}