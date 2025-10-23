{
  pkgs,
  settings,
  ...
}: {
  home.packages = with pkgs; [
    gh
    git
    lazygit
  ];

  programs.git = {
    enable = true;
    settings = {
      user = {
        email = "${settings.email}";
        name = "${settings.usernameFull}";
      };
      init = {
        defaultBranch = "main";
      };
    };
  };
}
