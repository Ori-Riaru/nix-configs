{
  pkgs,
  settings,
  ...
}: {
  programs.jujutsu = {
    enable = true;
    settings = {
      user = {
        name = settings.usernameFull;
        email = settings.email;
      };
    };
  };
}
