{
  pkgs,
  settings,
  ...
}: {
  home.packages = with pkgs; [
    gh
    lazygit
    git-filter-repo
  ];

  programs.git = {
    enable = true;
    lfs.enable = true;
    settings = {
      user = {
        email = "${settings.email}";
        name = "${settings.usernameFull}";
      };
      init = {
        defaultBranch = "main";
      };
      pull = {
        default = "current";
        ff = "only";
      };

      diff = {
        algorithm = "histogram";
        colorMoved = "plain";
        mnemonicprefix = true;
      };
      merge = {
        stat = "true";
        conflictstyle = "zdiff3";
        tool = "meld";
      };
      rerere = {
        enabled = true;
        autoupdate = true;
      };
    };
  };

  home.file.".config/lazygit/config.yml".text = ''
    # yaml-language-server: $schema=https://raw.githubusercontent.com/jesseduffield/lazygit/master/schema/config.json
    notARepository: 'skip'
  '';
}
