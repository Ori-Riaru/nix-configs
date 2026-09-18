{pkgs, ...}: {
  home.packages = with pkgs; [procps];

  programs.elephant.provider.menus.toml.system = {
    name = "system";
    name_pretty = "System";
    icon = "computer";
    entries = [
      {
        text = "CPU";
        keywords = ["cpu" "load" "processor"];
        icon = "cpu";
        async = "echo $(top -bn1 | grep 'Cpu(s)' | awk '{printf \"%.1f%%\", 100 - $8}')";
        actions = {copy = "wl-copy '%VALUE%'";};
      }
      {
        text = "Memory";
        keywords = ["memory" "ram" "mem"];
        icon = "memory";
        async = "echo $(free -h | awk '/^Mem:/ {printf \"%s used / %s total\", $3, $2}')";
        actions = {copy = "wl-copy '%VALUE%'";};
      }
      {
        text = "Disk";
        keywords = ["disk" "drive" "storage" "space"];
        icon = "drive-harddisk-symbolic";
        async = "echo $(df -h / /mnt/nfs/riaru /mnt/nfs/bulk 2>/dev/null | awk 'NR>1 {printf \"%s: %s/%s (%s)  \", $6, $3, $2, $5}')";
        actions = {copy = "wl-copy '%VALUE%'";};
      }
      {
        text = "Temperature";
        keywords = ["temp" "thermal" "heat"];
        icon = "sensors-temperature-symbolic";
        async = "echo $(awk '{printf \"%.1f C\", $1/1000}' \"$(grep -lE 'x86_pkg_temp|TCPU' /sys/class/thermal/thermal_zone*/type | sed 's/type$/temp/' | head -1)\" 2>/dev/null)";
        actions = {copy = "wl-copy '%VALUE%'";};
      }
      {
        text = "Uptime";
        keywords = ["uptime" "up" "time"];
        icon = "clock";
        async = "echo $(uptime -p)";
        actions = {copy = "wl-copy '%VALUE%'";};
      }
      {
        text = "Time & Date";
        keywords = ["date" "time" "today" "clock" "calendar"];
        icon = "x-office-calendar";
        async = "echo $(date '+%A %d %B %Y - %H:%M')";
        actions = {copy = "wl-copy '%VALUE%'";};
      }
    ];
  };
}
