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
        stylelint.vscode-stylelint # TODO: fix dependency
        meganrogge.template-string-converter

        # CSV
        grapecity.gc-excelviewer

        # PDF
        tomoki1207.pdf

        # XML
        redhat.vscode-xml

        # YAML
        redhat.vscode-yaml

        # TOML
        bungcip.better-toml

        # Java
        redhat.java

        # Rust
        rust-lang.rust-analyzer
        vadimcn.vscode-lldb
        tamasfe.even-better-toml
        serayuzgur.crates

        # C++
        llvm-vs-code-extensions.vscode-clangd
        ms-vscode.hexeditor

        # Python
        ms-python.python
        ms-toolsai.jupyter

        # Generic
        usernamehw.errorlens
        streetsidesoftware.code-spell-checker
        esbenp.prettier-vscode
        formulahendry.code-runner
        bierner.docs-view
        aaron-bond.better-comments
        pkief.material-product-icons
        supermaven.supermaven
        eamodio.gitlens
        gruntfuggly.todo-tree

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
        tauri-apps.tauri-vscode
        littensy.charmed-icons

        dtoplak.vscode-glsllint # TODO: fix dependency
        slevesque.shader
        hideoo.toggler
        yandeu.five-server
        # gencer.html-slim-scss-css-class-completion # TODO confirm working

        # Python
        kevinrose.vsc-python-indent
        charliermarsh.ruff
      ])
      ++ (with extensions.vscode-marketplace; [
        bbenoist.qml

        philsinatra.nested-comments

        # Typescript
        oven.bun-vscode
        wallabyjs.quokka-vscode
        wallabyjs.console-ninja # TODO: fix dependency

        csstools.postcss
        joy-yu.css-snippets
        formulahendry.auto-rename-tag
      ]);
  };
}
