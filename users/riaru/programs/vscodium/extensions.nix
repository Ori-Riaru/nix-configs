{
  pkgs,
  inputs,
  ...
}: {
  programs.vscode = let
    extensions = inputs.nix-vscode-extensions.extensions.x86_64-linux;
  in {
    extensions = with pkgs.vscode-extensions;
      [
        # Nix
        mkhl.direnv
        arrterian.nix-env-selector
        jnoortheen.nix-ide
        kamadorueda.alejandra

        # Web
        ecmel.vscode-html-css
        ms-vscode.live-server
        naumovs.color-highlight
        meganrogge.template-string-converter

        # Rust
        rust-lang.rust-analyzer
        vadimcn.vscode-lldb
        tamasfe.even-better-toml
        serayuzgur.crates

        # Python
        ms-python.python
        ms-toolsai.jupyter

        # C++
        llvm-vs-code-extensions.vscode-clangd
        ms-vscode.hexeditor

        # Java
        redhat.java

        # Other
        grapecity.gc-excelviewer # CSV viewer
        tomoki1207.pdf # PDF viewer
        redhat.vscode-xml # XML support
        redhat.vscode-yaml # YAML support

        # Generic
        usernamehw.errorlens
        streetsidesoftware.code-spell-checker
        esbenp.prettier-vscode
        formulahendry.code-runner
        bierner.docs-view
        aaron-bond.better-comments
        eamodio.gitlens
        gruntfuggly.todo-tree
        supermaven.supermaven
        ms-vsliveshare.vsliveshare
        pkief.material-product-icons

        # Look at later
        # https://marketplace.visualstudio.com/items?itemName=usernamehw.commands
        # https://marketplace.visualstudio.com/items?itemName=sleistner.vscode-fileutils
        # https://marketplace.visualstudio.com/items?itemName=kameshkotwani.google-search
        # https://marketplace.visualstudio.com/items?itemName=pranaygp.vscode-css-peek
        # https://marketplace.visualstudio.com/items?itemName=maptz.regionfolder
        # https://marketplace.visualstudio.com/items?itemName=alefragnani.Bookmarks
        # https://marketplace.visualstudio.com/items?itemName=urbantrout.refactor-css
        # https://marketplace.visualstudio.com/items?itemName=tahabasri.snippets
      ]
      ++ (with extensions.open-vsx; [
        # Web
        yandeu.five-server
        # gencer.html-slim-scss-css-class-completion
        tauri-apps.tauri-vscode

        # Python
        kevinrose.vsc-python-indent
        charliermarsh.ruff

        # Other
        slevesque.shader

        # Generic
        hideoo.toggler
        littensy.charmed-icons
      ])
      ++ (with extensions.vscode-marketplace; [
        # Web
        csstools.postcss
        joy-yu.css-snippets
        philsinatra.nested-comments
        oven.bun-vscode
        wallabyjs.quokka-vscode
        wallabyjs.console-ninja

        # Other
        bbenoist.qml #QML language support

        # Generic
        mguellsegarra.highlight-on-copy
      ]);
  };

  nixpkgs.overlays = let
    customCss = builtins.replaceStrings ["'" "\"" "\n" "\r"] ["\\'" "\\\"" "\\n" ""] (builtins.readFile ./custom.css);
    customJs = builtins.replaceStrings ["'" "\"" "\n" "\r" "`" "$"] ["\\'" "\\\"" "\\n" "" "\\`" "\\$"] (builtins.readFile ./script.js);
  in [
    (self: super: {
      vscodium = super.vscodium.overrideAttrs (attrs: {
        buildInputs = attrs.buildInputs ++ [self.perl];
        postInstall = ''
          workbenchPath="$out/lib/vscode/resources/app/out/vs/code/electron-sandbox/workbench/workbench.html"

          # Remove Content Security Policy
          perl -0777 -i -pe 's/<meta\s+http-equiv="Content-Security-Policy".*?\/>//gs' "$workbenchPath"

          # Inject custom CSS and JS
          sed -i '/<\/html>/i\
          <!-- nix vscode styling -->\
          <style id="nix-custom-css">\
          '"${customCss}"'\
          </style>\
          <script id="nix-custom-js">\
          '"${customJs}"'\
          </script>' "$workbenchPath"
        '';
      });
    })
  ];
}
