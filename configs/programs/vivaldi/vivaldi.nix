{pkgs, ...}: {
  home.packages = with pkgs; [
    (vivaldi.override {
      proprietaryCodecs = true;
      vivaldi-ffmpeg-codecs = vivaldi-ffmpeg-codecs;
    })
    vivaldi-ffmpeg-codecs
  ];

  home.file.".config/vivaldi/customcss/custom.css".text = builtins.readFile ./custom.css;
}
