{pkgs, ...}: {
  home.packages = with pkgs; [
    (opencode.overrideAttrs (oldAttrs: {
      patches =
        (oldAttrs.patches or [])
        ++ [
          ./logo-changes.patch
        ];
    }))
  ];

  home.file.".config/opencode/opencode.json".text = ''
    {
      "$schema": "https://opencode.ai/config.json",
      "autoupdate": false
    }
  '';

  home.file.".config/opencode/tui.json".text = ''
    {
      "theme": "system",
      "attention": {
        "enabled": true,
            "sound": true,
            "volume": 0.4,
            "sound_pack": "opencode.default",
            "sounds": {
              "error": "./sounds/error.mp3"
            }
      }
    }
  '';
}
