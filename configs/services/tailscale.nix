{
  # MANUAL: authentication of each client to the headscale server is required by runnig the following
  # command `sudo tailscale up`. And then following
  # steps presented.

  services.tailscale = {
    enable = true;
    extraUpFlags = ["--login-server=https://tail.riaru.xyz"];
  };
  services.resolved.enable = true;
}
