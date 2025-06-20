{
  services.home-assistant = {
    enable = false;
    extraComponents = [
      "esphome"
      "met"
      "radio_browser"
      "tplink"
    ];

    config = {
      default_config = {};
      http = {
        server_host = "::1";
        trusted_proxies = ["::1"];
        use_x_forwarded_for = true;
      };
    };
  };
}
