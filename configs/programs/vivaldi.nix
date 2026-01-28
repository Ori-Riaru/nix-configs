{pkgs, ...}: {
  home.packages = with pkgs; [
    (vivaldi.override {
      proprietaryCodecs = true;
    })
    vivaldi-ffmpeg-codecs
  ];
}
