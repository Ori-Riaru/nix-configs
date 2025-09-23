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
    userEmail = "${settings.email}";
    userName = "${settings.usernameFull}";
    extraConfig = {
      init = {
        defaultBranch = "main";
      };
    };
  };
}
