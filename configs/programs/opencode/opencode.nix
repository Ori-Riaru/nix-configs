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
}
