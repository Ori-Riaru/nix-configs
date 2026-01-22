{pkgs, ...}: {
  programs.chromium = {
    enable = true;
    package = pkgs.ungoogled-chromium;
    extensions = [
      "cjpalhdlnbpafiamejdnhcphjbkeiagm" # ublock
      "eimadpbcbfnmbkopoojfekhnkhdbieeh" # dark reader
      "aapbdbdomjkkjkaonfhkkikfgjllcleb" # google translate
    ];
  };
}
