{pkgs, ...}: {
  home.packages = with pkgs; [
    micro
  ];

  home.sessionVariables = {
    EDITOR = "micro";
  };
}
