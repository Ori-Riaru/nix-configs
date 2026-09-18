{
  config,
  pkgs,
  lib,
  ...
}: let
  t = config.theme;

  colorscheme = pkgs.writeText "neutral-dark.micro" ''
    color-link default "${t.text},${t.section}"
    color-link comment "italic ${t.green},${t.section}"
    color-link identifier "${t.teal},${t.section}"
    color-link constant "${t.blue},${t.section}"
    color-link statement "${t.orange},${t.section}"
    color-link preproc "${t.red},${t.section}"
    color-link type "${t.blue},${t.section}"
    color-link special "${t.pink},${t.section}"
    color-link symbol "${t.purple},${t.section}"
    color-link underlined "underline ${t.cyan},${t.section}"
    color-link error "${t.red},${t.section}"
    color-link todo "bold ${t.yellow},${t.section}"
    color-link ignore "${t.hidden},${t.section}"

    color-link selection "${t.text},${t.float}"
    color-link cursor-line "${t.card}"
    color-link color-column "${t.orange-dark}"

    color-link statusline "${t.subtext},${t.float}"
    color-link statusline.inactive "${t.subtext},${t.section}"
    color-link statusline.suggestions "${t.text},${t.overlay}"
    color-link tabbar "${t.subtext},${t.section}"
    color-link tabbar.active "${t.text},${t.overlay}"

    color-link indent-char "${t.hidden}"
    color-link line-number "${t.hidden}"
    color-link current-line-number "${t.subtext}"
    color-link gutter-info "${t.subtext}"
    color-link gutter-error "${t.red}"
    color-link gutter-warning "${t.orange}"
    color-link scrollbar "${t.subtext}"
    color-link divider "${t.hidden}"
    color-link message "${t.text}"
    color-link error-message "${t.red}"
    color-link match-brace "bold ${t.text}"
    color-link hlsearch "${t.purple-dim},${t.text}"
    color-link trailingws "${t.red}"

    color-link diff-added "${t.teal}"
    color-link diff-modified "${t.purple}"
    color-link diff-deleted "${t.red}"
  '';
in {
  imports = [
    ./micro/plugins.nix
  ];

  home.packages = with pkgs; [
    wl-clipboard
    go
    gopls
    rust-analyzer
    python3Packages.python-lsp-server
    typescript-language-server
  ];

  programs.micro = {
    enable = true;

    settings = {
      # === Behavior ===

      autosave = 5;
      autosu = true;
      keepautoindent = true;
      mkparents = true;
      smartpaste = true;
      savehistory = true;
      savecursor = true;
      saveundo = true;

      tabstospaces = true;
      tabsize = 4;
      tabmovement = true;

      hltrailingws = true;
      rmtrailingws = true;
      ignorecase = true;
      incsearch = true;
      hlsearch = true;
      matchbrace = true;
      matchbraceleft = true;
      clipboard = "external";
      useprimary = true;

      # === Built-in Plugins ===

      autoclose = true;
      comment = true;
      linter = true;
      diff = true;
      diffgutter = true;
      status = true;
      ftoptions = true;

      # === Layout ===

      colorscheme = lib.mkForce "neutral-dark";
      truecolor = "auto";
      basename = true;
      cursorline = true;
      ruler = true;
      relativeruler = false;
      scrollbar = true;
      scrollbarchar = "▌";
      scrollmargin = 8;
      scrollspeed = 5;
      colorcolumn = 100;
      softwrap = false;
      wordwrap = false;
      statusline = true;
      tabalways = true;
      tabreverse = true;
      statusformatl = "$(filename) $(modified)$(overwrite)($(line),$(col)) $(status.paste)| ft:$(opt:filetype) | $(opt:fileformat) | $(opt:encoding)";
      statusformatr = "$(bind:ToggleKeyMenu):keys, $(bind:ToggleHelp):help";

      # === Plugins ===

      fish = true;
      wc = true;
      snippets = true;
      fzf = true;
      go = true;
      editorconfig = true;
      detectindent = true;
      runit = true;
      lsp = true;
      filemanager = true;

      # === LSP plugin (mirrors the VSCodium language servers) ===

      "lsp.server" = "rust=rust-analyzer,nix=nixd,go=gopls,python=pylsp,c=clangd,cpp=clangd,typescript=typescript-language-server --stdio,javascript=typescript-language-server --stdio";
      "lsp.formatOnSave" = true;
      "lsp.tabcompletion" = true;
    };
  };

  xdg.configFile."micro/bindings.json".text = builtins.toJSON {
    "CtrlUp" = "CursorUp,CursorUp,CursorUp,CursorUp";
    "CtrlDown" = "CursorDown,CursorDown,CursorDown,CursorDown";
  };

  xdg.configFile."micro/colorschemes/neutral-dark.micro".source = colorscheme;

  home.sessionVariables = {
    EDITOR = "micro";
  };
}
