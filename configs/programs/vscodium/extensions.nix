{
  pkgs,
  inputs,
  ...
}: {
  programs.vscode = {
    mutableExtensionsDir = false;

    profiles.default = let
      extensions = inputs.nix-vscode-extensions.extensions.x86_64-linux;
    in {
      enableExtensionUpdateCheck = false;

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
          svelte.svelte-vscode
          vue.volar

          # Rust
          rust-lang.rust-analyzer
          vadimcn.vscode-lldb
          tamasfe.even-better-toml
          fill-labs.dependi

          # Go
          golang.go
          zxh404.vscode-proto3

          # Python
          #// ms-python.python
          ms-toolsai.jupyter

          # C++
          ms-vscode.cpptools
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
          bierner.docs-view
          aaron-bond.better-comments
          eamodio.gitlens
          gruntfuggly.todo-tree
          ms-vsliveshare.vsliveshare
          pkief.material-product-icons
          github.copilot
          github.copilot-chat
          github.vscode-pull-request-github
        ]
        ++ (with extensions.open-vsx; [
          # Web
          yandeu.five-server
          #// gencer.html-slim-scss-css-class-completion

          tauri-apps.tauri-vscode

          # Python
          kevinrose.vsc-python-indent
          #//charliermarsh.ruff

          # Other
          prettier.prettier-vscode
          stylelint.vscode-stylelint
          slevesque.shader
          hideoo.toggler
          littensy.charmed-icons
          #// jannisx11.batch-rename-extension
          sleistner.vscode-fileutils
        ])
        ++ (with extensions.vscode-marketplace; [
          # Web
          csstools.postcss
          joy-yu.css-snippets
          #// philsinatra.nested-comments
          oven.bun-vscode
          #// wallabyjs.quokka-vscode
          #// wallabyjs.console-ninja

          # Other
          msyrus.go-doc
          premparihar.gotestexplorer
          bbenoist.qml
          #// kdl-org.kdl # KDL language support
          letrieu.expand-region
          #// eww-yuck.yuck

          # Generic
          mguellsegarra.highlight-on-copy
          google.gemini-cli-vscode-ide-companion
        ]);
    };
  };

  # Extensions like custom css and js don't work because of nix store. This manually injects custom css and js the same way the extension would
  nixpkgs.overlays = let
    customCss = builtins.replaceStrings ["'" "\"" "\n" "\r"] ["\\'" "\\\"" "\\n" ""] (builtins.readFile ./custom.css);
    customJs = builtins.replaceStrings ["'" "\"" "\n" "\r" "`" "$"] ["\\'" "\\\"" "\\n" "" "\\`" "\\$"] (builtins.readFile ./custom.js);
  in [
    (self: super: {
      vscodium = super.vscodium.overrideAttrs (attrs: {
        buildInputs = attrs.buildInputs ++ [self.perl];
        postInstall = ''
          workbenchPath="$out/lib/vscode/resources/app/out/vs/code/electron-browser/workbench/workbench.html"
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
