{
  pkgs,
  lib,
  ...
}: let
  jsonFormat = pkgs.formats.json {};

  singlePlugins = [
    {
      name = "fish"; # fish-aware autocompletion
      url = "https://raw.githubusercontent.com/micro-editor/updated-plugins/master/micro-fish-plugin/fish.lua";
      sha256 = "sha256-jfZeTT7lkoOcWKU48I4gcMYamtO/wkSVCyKuJYqCtno=";
    }
    {
      name = "wc"; # word / char count in the statusline
      url = "https://raw.githubusercontent.com/micro-editor/updated-plugins/master/micro-wc-plugin/wc.lua";
      sha256 = "sha256-Ua3VzKYoSJ6MhJpb2B2Kf86Brc0j5/G2jH9zplGhht4=";
    }
    {
      name = "snippets"; # snippet expansion
      url = "https://raw.githubusercontent.com/micro-editor/updated-plugins/master/micro-snippets-plugin/snippets.lua";
      sha256 = "sha256-G0lyVqs6d9T/ereCXXPxWVq/LulLfaAwmYZVibmQt5Y=";
    }
    {
      name = "fzf"; # fuzzy file open (quick open)
      url = "https://raw.githubusercontent.com/micro-editor/updated-plugins/master/fzf/main.lua";
      sha256 = "sha256-m9vJLRMrsXs2e3aNSNtpqUKWVq+hVRNO2nSnIzJUa1M=";
    }
    {
      name = "go"; # gofmt / goimports on save (golang.go)
      url = "https://raw.githubusercontent.com/micro-editor/go-plugin/master/go.lua";
      sha256 = "sha256-K9LfhFgZHgW2HUKy34J3xUzDU1bs/Ph2sbgsefU1Hgc=";
    }
    {
      name = "detectindent"; # auto-detect indentation per file
      url = "https://raw.githubusercontent.com/dmaluka/micro-detectindent/master/detectindent.lua";
      sha256 = "sha256-WP6AjR3rp4uB4fikA+dWDrLmutHozmECvVxeseQT0xo=";
    }
    {
      name = "runit"; # F5 / F9 / F12 run the current file
      url = "https://raw.githubusercontent.com/terokarvinen/micro-run/master/main.lua";
      sha256 = "sha256-aPd17hBN4ix0ZZ4PC12B6wrwv4K9yIYCchkEJkOJXRI=";
      destName = "runit.lua";
    }
  ];

  # Plugins distributed as zip archives pulling a specific versioned release.
  zippedPlugins = [
    {
      name = "editorconfig"; # .editorconfig support
      src = pkgs.fetchzip {
        url = "https://github.com/micro-editor/plugin-channel/releases/download/plugins/editorconfig-micro-1.0.0.zip";
        sha256 = "1s80igcxyyadap6y89phrvy02h0r9n1lm6jyj5j657hkgr0bdnk4";
      };
      pluginFile = "editorconfig.lua";
    }
    {
      name = "lsp"; # LSP client (rust-analyzer, nixd, gopls, ...)
      src = pkgs.fetchzip {
        url = "https://github.com/micro-editor/plugin-channel/releases/download/plugins/micro-plugin-lsp-0.6.2.zip";
        sha256 = "0xk4p000bvsx06qmb8m4m0lqj09b2p483frrnn6c48znpdlcf4hi";
      };
      pluginFile = "main.lua"; # must be named after the plugin (lsp.lua)
      extraDirs = ["help"];
    }
    {
      name = "filemanager"; # file tree sidebar
      src = pkgs.fetchzip {
        url = "https://github.com/micro-editor/updated-plugins/releases/download/v1.0.0/filemanager-3.5.1.zip";
        sha256 = "1y1gd682s6kpwn8bp76fv8addr10mlxpkg27j1im17654bdzqarq";
      };
      pluginFile = "filemanager.lua";
      extraDirs = ["syntax.yaml"];
    }
  ];

  singlePropagated = map (p:
    p
    // {
      file = pkgs.fetchurl {
        inherit (p) url sha256;
        name = "${p.name}.lua";
      };
      destName = p.destName or "${p.name}.lua";
    })
  singlePlugins;

  zippedPropagated = map (z:
    z
    // {
      destName = "${z.name}.lua";
    })
  zippedPlugins;

  allPlugins = singlePropagated ++ zippedPropagated;

  pluginRepos = {
    fish = "https://raw.githubusercontent.com/micro-editor/updated-plugins/master/micro-fish-plugin/repo.json";
    wc = "https://raw.githubusercontent.com/micro-editor/updated-plugins/master/micro-wc-plugin/repo.json";
    snippets = "https://raw.githubusercontent.com/micro-editor/updated-plugins/master/micro-snippets-plugin/repo.json";
    fzf = "https://raw.githubusercontent.com/micro-editor/updated-plugins/master/fzf/repo.json";
    go = "https://raw.githubusercontent.com/micro-editor/plugin-channel/master/plugins/go.json";
    detectindent = "https://raw.githubusercontent.com/micro-editor/plugin-channel/master/plugins/micro-detectindent.json";
    runit = "https://raw.githubusercontent.com/micro-editor/plugin-channel/master/plugins/micro-run.json";
    editorconfig = "https://raw.githubusercontent.com/micro-editor/plugin-channel/master/plugins/editorconfig-micro.json";
    lsp = "https://raw.githubusercontent.com/micro-editor/plugin-channel/master/plugins/micro-plugin-lsp.json";
    filemanager = "https://raw.githubusercontent.com/micro-editor/updated-plugins/master/filemanager-plugin/repo.json";
  };

  pluginsJson = jsonFormat.generate "plugins.json" (lib.filterAttrs (_: v: v != null) (
    builtins.foldl' (acc: p: acc // {${p.name} = pluginRepos.${p.name};}) {} allPlugins
  ));

  plugDir = pkgs.runCommand "micro-plugins" {} ''
    mkdir -p $out
    ${lib.concatStringsSep "\n" (map (p: ''
        mkdir -p $out/${p.name}
        cp ${p.file} $out/${p.name}/${p.destName}
      '')
      singlePropagated)}

    ${lib.concatStringsSep "\n" (map (z: ''
        mkdir -p $out/${z.name}
        cp ${z.src}/${z.pluginFile} $out/${z.name}/${z.destName}
        cp ${z.src}/repo.json $out/${z.name}/repo.json
        ${lib.concatStringsSep "\n" (map (d: "cp -r ${z.src}/${d} $out/${z.name}/") (z.extraDirs or []))}
      '')
      zippedPropagated)}
  '';
in {
  xdg.configFile."micro/plug".source = plugDir;
  xdg.configFile."micro/plugins.json".source = pluginsJson;
}
