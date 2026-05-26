{
  pkgs,
  inputs,
  lib,
  ...
}: {
  home.packages = with pkgs; [
    mypy
  ];

  programs.vscodium = {
    mutableExtensionsDir = false;

    profiles.default = let
      extensions = inputs.nix-vscode-extensions.extensions.x86_64-linux;
    in {
      enableExtensionUpdateCheck = false;

  

      extensions = with pkgs.vscode-extensions;
        [
          # === Language Support ===

          # Nix
          mkhl.direnv
          arrterian.nix-env-selector
          jnoortheen.nix-ide
          kamadorueda.alejandra
          christian-kohler.path-intellisense

          # Web
          ecmel.vscode-html-css
          ms-vscode.live-server
          naumovs.color-highlight
          meganrogge.template-string-converter
          svelte.svelte-vscode
          vue.volar
          dbaeumer.vscode-eslint
          yoavbls.pretty-ts-errors

          # Rust
          rust-lang.rust-analyzer
          vadimcn.vscode-lldb
          tamasfe.even-better-toml
          fill-labs.dependi

          # Go
          golang.go
          zxh404.vscode-proto3

          # Python
          # ms-python.python
          ms-toolsai.jupyter

          # C++
          # ms-vscode.cpptools
          llvm-vs-code-extensions.vscode-clangd
          ms-vscode.hexeditor
          xaver.clang-format

          # Java
          redhat.java

          # C#
          # ms-dotnettools.vscode-dotnet-runtime
          # ms-dotnettools.csdevkit
          # ms-dotnettools.csharp

          # R
          # reditorsupport.r
          # reditorsupport.r-syntax

          # Other
          grapecity.gc-excelviewer # CSV viewer
          tomoki1207.pdf # PDF viewer
          redhat.vscode-xml # XML support
          redhat.vscode-yaml # YAML support
          # visualstudiotoolsforunity.vstuc # Unity support
          ms-vscode.makefile-tools

          # === Generic ===

          usernamehw.errorlens
          streetsidesoftware.code-spell-checker
          bierner.docs-view
          aaron-bond.better-comments
          eamodio.gitlens
          gruntfuggly.todo-tree
          ms-vsliveshare.vsliveshare
          pkief.material-product-icons
          github.vscode-pull-request-github
        ]
        ++ (with extensions.open-vsx; [
          # Web
          yandeu.five-server
          #// gencer.html-slim-scss-css-class-completion

          tauri-apps.tauri-vscode

          # Python
          kevinrose.vsc-python-indent
          charliermarsh.ruff
          njqdev.vscode-python-typehint
          ericsia.pythonsnippets3
          matangover.mypy

          # Other
          esbenp.prettier-vscode
          slevesque.shader
          hideoo.toggler
          littensy.charmed-icons
          qwtel.sqlite-viewer
          drinfinite.batch-rename
          sleistner.vscode-fileutils
          pcode-pl.vscode-autohide-plus
          wix.vscode-import-cost
          markdown-inline-preview.markdown-inline-preview
          davidanson.vscode-markdownlint
          yzhang.markdown-all-in-one
          shd101wyy.markdown-preview-enhanced
        ])
        ++ (with extensions.vscode-marketplace; [
          # Web
          joy-yu.css-snippets
          rubymaniac.vscode-paste-and-indent
          stylelint.vscode-stylelint
          ms-toolsai.jupyter-renderers
          posit.air-vscode
          pucelle.vscode-css-navigation

          philsinatra.nested-comments
          oven.bun-vscode
          #// wallabyjs.quokka-vscode
          #// wallabyjs.console-ninja

          # Other
          msyrus.go-doc
          premparihar.gotestexplorer
          bbenoist.qml
          #// kdl-org.kdl # KDL language support
          #// letrieu.expand-region
          eww-yuck.yuck
          eduarddyckman.vscode-parinfer
          dandehoon.vscode-generic-expand-selection
          dioxuslabs.dioxus

          # Generic
          mguellsegarra.highlight-on-copy
        ]);
    };
  };

  # Required for `reditorsupport` extension
  home.file.".Rprofile".text = ''
    if (interactive() && Sys.getenv("RSTUDIO") == "") {
      source(file.path(Sys.getenv(if (.Platform$OS.type == "windows") "USERPROFILE" else "HOME"), ".vscode-R", "init.R"))
    }
  '';

  # Extensions like custom css and js don't work because of nix store. Instead
  # achieve the same result we manually injects custom css and js the same way
  # the extension would below
  nixpkgs.overlays = [
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
  ];
}
