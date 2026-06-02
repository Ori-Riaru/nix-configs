{
  pkgs,
  settings,
  ...
}: {
  home.packages = with pkgs; [wl-clipboard];

  programs.micro = {
    enable = true;
    settings = {
    };
  };

  home.sessionVariables = {
    EDITOR = "micro";
  };
}
