(final: prev: {
  vscodium = prev.vscodium.overrideAttrs (attrs: {
    nativeBuildInputs = (attrs.nativeBuildInputs or []) ++ [final.python3];
    postInstall = let
      cssFile = final.writeText "vscodium-custom.css" (builtins.readFile ./custom.css);
      jsFile = final.writeText "vscodium-custom.js" (builtins.readFile ./custom.js);
    in ''
      workbenchPath="$out/lib/vscode/resources/app/out/vs/code/electron-browser/workbench/workbench.html"

      python - "$workbenchPath" "${cssFile}" "${jsFile}" <<'PYEOF'
      import sys, re, pathlib

      p   = pathlib.Path(sys.argv[1])
      css = pathlib.Path(sys.argv[2]).read_text()
      js  = pathlib.Path(sys.argv[3]).read_text()

      html = p.read_text()
      html = re.sub(
          r'<meta\s+http-equiv="Content-Security-Policy".*?/>',
          "",
          html,
          flags=re.DOTALL
      )

      injection = (
          "\n<!-- nix vscode styling -->\n"
          f'<style id="nix-custom-css">\n{css}\n</style>\n'
          f'<script id="nix-custom-js">\n{js}\n</script>\n'
      )

      html = html.replace("</html>", injection + "</html>")
      p.write_text(html)
      PYEOF
    '';
  });
})
