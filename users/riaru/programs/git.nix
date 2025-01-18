{pkgs, ...}: {
  home.packages = with pkgs; [
    gh
    git
  ];

  programs.git = {
    enable = true;
    userEmail = "riaruazaki@proton.me";
    userName = "Riaru Azaki";
  };
}
