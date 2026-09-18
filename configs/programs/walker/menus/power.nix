{
  programs.elephant.provider.menus.toml.power = {
    name = "power";
    name_pretty = "Power";
    icon = "system-shutdown-symbolic";
    entries = [
      {
        text = "Shutdown";
        keywords = ["shutdown" "power off" "off"];
        icon = "system-shutdown-symbolic";
        actions = {shutdown = "systemctl poweroff";};
      }
      {
        text = "Restart";
        keywords = ["reboot"];
        icon = "system-reboot-symbolic";
        actions = {restart = "systemctl reboot";};
      }
      {
        text = "Suspend";
        keywords = ["suspend" "sleep"];
        icon = "system-suspend-symbolic";
        actions = {suspend = "loginctl lock-session; sleep 1; systemctl suspend";};
      }
      {
        text = "Hibernate";
        keywords = ["sleep"];
        icon = "drive-harddisk-symbolic";
        actions = {hibernate = "loginctl lock-session; sleep 1; systemctl hibernate";};
      }
      {
        text = "Logout";
        keywords = ["logout"];
        icon = "system-log-out-symbolic";
        actions = {logout = "niri msg action quit || loginctl terminate-session \"$XDG_SESSION_ID\"";};
      }
      {
        text = "Lock";
        keywords = ["lock" "lockscreen"];
        icon = "system-lock-screen-symbolic";
        actions = {lock = "loginctl lock-session";};
      }
    ];
  };
}