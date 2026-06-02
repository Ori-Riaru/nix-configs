{
  security.sudo-rs = {
    enable = true;
    extraRules = [
      {
        users = ["riaru"];
        commands = [
          {
            command = "ALL";
            options = ["NOPASSWD"];
          }
        ];
      }
    ];
  };
}
