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
}
