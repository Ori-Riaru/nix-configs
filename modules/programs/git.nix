{
  pkgs,
  settings,
  ...
}: {
  home.packages = with pkgs; [
    gh
    git
  ];

  programs.git = {
    enable = true;
    userEmail = "${settings.email}";
    userName = "${settings.username}";
  };
}
