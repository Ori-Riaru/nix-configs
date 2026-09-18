{pkgs, ...}: {
  home.packages = with pkgs; [
    efibootmgr
    (pkgs.writeShellScriptBin "boot-windows" ''
      WINDOWS_ENTRY=$(efibootmgr | grep -i "Windows Boot Manager" | cut -c5-8)
      sudo efibootmgr --bootnext $WINDOWS_ENTRY
      sudo reboot
    '')
  ];

  programs.elephant.provider.menus.toml.efi = {
    name = "efi";
    name_pretty = "EFI";
    icon = "󰋊";
    entries = [
      {
        text = "Boot Windows";
        keywords = ["reboot" "restart" "windows"];
        icon = "󰖳";
        actions = {"boot windows" = "boot-windows";};
      }
    ];
  };
}
