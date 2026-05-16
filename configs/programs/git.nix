{
  pkgs,
  settings,
  ...
}: {
  home.packages = with pkgs; [
    gh
    git
    lazygit
    git-filter-repo
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
