{
  security.sudo.extraRules = [
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
}
