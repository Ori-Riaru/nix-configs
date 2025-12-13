{pkgs, ...}: {
  home.packages = with pkgs; [
    (pkgs.opencode.overrideAttrs (oldAttrs: {
      patches =
        (oldAttrs.patches or [])
        ++ [
          ./logo-changes.patch
        ];
    }))
  ];
}
