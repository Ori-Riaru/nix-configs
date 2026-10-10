{settings, ...}: {
  programs.aria2 = {
    enable = true;
    systemd.enable = true;
    settings = {
      dir = "/home/${settings.username}/Downloads";
      continue = true;
      file-allocation = "falloc";

      max-concurrent-downloads = 10;
      max-connection-per-server = 8;
      min-split-size = "10M";
      split = 8;

      bt-save-metadata = true;
    };
  };
}
