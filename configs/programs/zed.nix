{
  config,
  settings,
  pkgs,
  ...
}: {
  stylix.targets.zed.enable = false;

  programs.zed-editor = {
    enable = true;
    package = pkgs.master.zed-editor;

    extraPackages = with pkgs; [
      alejandra
      nixd
      typescript-language-server
      bash-language-server
      svelte-language-server
      vscode-langservers-extracted
      clang-tools
      gopls
      rust-analyzer
      rustfmt
      taplo
      yaml-language-server
      marksman
      lua-language-server
      dockerfile-language-server
      stylelint-lsp
      basedpyright
      ruff
      prettier
    ];

    extensions = [
      "nix"
      "toml"
      "lua"
      "dockerfile"
      "html"
      "svelte"
      "scss"
      "xml"
      "git-firefly"
      "charmed-icons"
      "material-icon-theme"
      "emmet"
    ];

    userSettings = {
      window_title_separator = " -";
      use_smartcase_search = true;
      colorize_brackets = false;
      middle_click_paste = false;
      lsp_document_colors = "inlay";
      code_lens = "on";
      completion_menu_item_kind = "symbol";
      show_completions_on_input = true;
      preferred_line_length = 80;
      soft_wrap_indent = "extra_one";
      auto_indent = "preserve_indent";
      auto_indent_on_paste = true;
      use_on_type_format = true;
      inline_code_actions = true;
      autoscroll_on_clicks = false;
      reveal_if_open = false;
      seed_search_query_from_cursor = "selection";
      vertical_scroll_margin = 20;
      show_wrap_guides = true;
      rounded_selection = true;
      diff_view_style = "unified";
      helix_mode = true;
      use_system_window_tabs = false;
      fullscreen_mode = "native";
      window_decorations = "server";
      disable_ai = true;
      auto_update = false;
      cli_default_open_behavior = "new_window";
      use_display_p3 = false;
      accessible_mode = false;
      redact_private_values = true;
      use_system_prompts = true;
      minimum_contrast_for_highlights = 45.0;
      proxy = "";

      prettier = {
        allowed = true;
      };
      vim = {
        show_edit_predictions_in_normal_mode = false;
        use_smartcase_find = false;
        toggle_relative_line_numbers = false;
      };
      sticky_scroll = {
        enabled = true;
      };
      which_key = {
        enabled = false;
      };
      session = {
        trust_all_worktrees = false;
      };
      gutter = {
        folds = false;
        min_line_number_digits = 2;
        line_numbers = true;
        bookmarks = false;
        git_gutter_width = {
          custom = 5.0;
        };
        breakpoints = false;
        runnables = false;
      };
      active_pane_modifiers = {
        inactive_opacity = 1;
      };
      focus_follows_mouse = {
        enabled = false;
      };
      centered_layout = {
        right_padding = 0.2;
        left_padding = 0.2;
      };
      status_bar = {
        show_active_file = false;
        "experimental.show" = false;
        pending_keystrokes_indicator = true;
        line_endings_button = false;
        cursor_position_button = true;
      };
      cursor_animation = {
        enabled = true;
      };
      markdown_preview = {
        code_font_family = config.theme.fontMonospace;
      };
      auto_install_extensions = {
        "charmed-icons" = true;
        dockerfile = true;
        emmet = true;
        "git-firefly" = true;
        html = true;
        lua = true;
        "material-icon-theme" = true;
        nix = true;
        scss = true;
        svelte = true;
        toml = true;
        xml = true;
      };

      project_panel = {
        auto_open = {
          on_create = true;
        };
        hide_hidden = false;
        hide_root = true;
        drag_and_drop = true;
        sticky_scroll = true;
        git_status_indicator = true;
        scrollbar = {
          horizontal_scroll = true;
        };
        diagnostic_badges = true;
        starts_open = false;
        button = true;
        dock = "left";
      };
      outline_panel = {
        multi_buffer_hide_symbols = false;
        button = true;
        dock = "left";
      };
      collaboration_panel = {
        dock = "left";
      };
      agent = {
        dock = "right";
        favorite_models = [];
        model_parameters = [];
      };
      git_panel = {
        file_icons = true;
        tree_view = true;
        collapse_untracked_diff = false;
        button = true;
        dock = "left";
      };
      preview_tabs = {
        enable_preview_file_from_code_navigation = true;
        enable_preview_from_multibuffer = true;
        enable_preview_from_project_panel = true;
        enabled = true;
        enable_keep_preview_on_code_navigation = false;
        enable_preview_multibuffer_from_code_navigation = false;
        enable_preview_from_file_finder = false;
      };
      tabs = {
        show_diagnostics = "off";
        show_close_button = "hover";
        file_icons = true;
        git_status = true;
      };
      debugger = {
        button = true;
      };

      base_keymap = "VSCode";
      theme = "One Dark";
      icon_theme = "Base Charmed Icons";
      ui_font_family = config.theme.font;
      ui_font_size = 16;

      title_bar = {
        open_menus_on_hover = false;
        button_layout = "";
        show_branch_status_icon = true;
        show_branch_name = true;
        show_worktree_name = true;
        show_project_items = true;
        show_onboarding_banner = false;
        show_sign_in = false;
        show_user_menu = false;
        show_user_picture = false;
        show_menus = false;
        show = "never";
      };
      tab_bar = {
        show_tab_bar_buttons = false;
        show = true;
        show_pinned_tabs_in_separate_row = true;
        show_nav_history_buttons = false;
      };
      toolbar = {
        breadcrumbs = false;
        quick_actions = false;
        selections_menu = true;
        agent_review = true;
        code_actions = false;
      };

      buffer_font_family = config.theme.fontMonospace;
      buffer_font_size = 14;
      buffer_line_height = {
        custom = 1.25;
      };
      tab_size = 2;
      hard_tabs = false;
      ensure_final_newline_on_save = true;
      remove_trailing_whitespace_on_save = true;
      soft_wrap = "editor_width";
      relative_line_numbers = "disabled";
      cursor_blink = true;
      cursor_shape = "bar";
      current_line_highlight = "line";
      show_whitespaces = "trailing";
      indent_guides = {
        background_coloring = "indent_aware";
        coloring = "fixed";
        active_line_width = 2;
        enabled = true;
        line_width = 1;
      };
      wrap_guides = [
        100
        120
      ];
      minimap = {
        current_line_highlight = "line";
        thumb_border = "left_open";
        max_width_columns = 80;
        thumb = "always";
        show = "never";
      };
      scrollbar = {
        axes = {
          horizontal = true;
        };
        search_results = true;
        git_diff = true;
        cursors = true;
        show = "auto";
      };
      scroll_beyond_last_line = "one_page";
      format_on_save = "on";
      autosave = {
        after_delay = {
          milliseconds = 1000;
        };
      };
      use_autoclose = true;
      linked_edits = true;
      inlay_hints = {
        enabled = true;
      };

      telemetry = {
        diagnostics = false;
        metrics = false;
      };

      theme_overrides = {
        "One Dark" = {
          "background.appearance" = "opaque";

          # Surfaces / chrome
          background = config.theme.section;
          "surface.background" = config.theme.section;
          "elevated_surface.background" = config.theme.card;
          "drop_target.background" = "${config.theme.accent}33";

          border = "#00000000";
          "border.variant" = "#00000000";
          "border.focused" = config.theme.accent;
          "border.selected" = config.theme.accent;
          "border.transparent" = "#00000000";
          "border.disabled" = config.theme.hidden;

          "element.background" = config.theme.card;
          "element.hover" = config.theme.overlay;
          "element.active" = config.theme.overlay;
          "element.selected" = config.theme.overlay;
          "element.disabled" = config.theme.section;

          "ghost_element.background" = "#00000000";
          "ghost_element.hover" = config.theme.card;
          "ghost_element.active" = config.theme.overlay;
          "ghost_element.selected" = config.theme.overlay;
          "ghost_element.disabled" = config.theme.section;

          text = config.theme.text;
          "text.muted" = config.theme.subtext;
          "text.placeholder" = config.theme.muted;
          "text.disabled" = config.theme.muted;
          "text.accent" = config.theme.accent;
          icon = config.theme.text;
          "icon.muted" = config.theme.subtext;
          "icon.disabled" = config.theme.muted;
          "icon.placeholder" = config.theme.muted;
          "icon.accent" = config.theme.accent;

          "status_bar.background" = config.theme.section;
          "title_bar.background" = config.theme.section;
          "title_bar.inactive_background" = config.theme.section;
          "toolbar.background" = config.theme.section;
          "tab_bar.background" = config.theme.section;
          "tab.inactive_background" = config.theme.section;
          "tab.active_background" = config.theme.overlay;
          "search.match_background" = "${config.theme.accent}44";
          "search.active_match_background" = "${config.theme.accent}66";
          "panel.background" = config.theme.section;
          "panel.focused_border" = config.theme.accent;
          "panel.indent_guide" = config.theme.hidden;
          "panel.indent_guide_active" = config.theme.subtext;
          "panel.indent_guide_hover" = config.theme.subtext;
          "pane.focused_border" = config.theme.accent;
          "pane_group.border" = "#00000000";

          "scrollbar.thumb.background" = "${config.theme.muted}66";
          "scrollbar.thumb.hover_background" = "${config.theme.muted}aa";
          "scrollbar.thumb.border" = "#00000000";
          "scrollbar.track.background" = "#00000000";
          "scrollbar.track.border" = "#00000000";

          # Editor
          "editor.foreground" = config.theme.text;
          "editor.background" = config.theme.section;
          "editor.gutter.background" = config.theme.section;
          "editor.subheader.background" = config.theme.card;
          "editor.active_line.background" = config.theme.card;
          "editor.highlighted_line.background" = config.theme.card;
          "editor.line_number" = config.theme.hidden;
          "editor.active_line_number" = config.theme.subtext;
          "editor.hover_line_number" = config.theme.subtext;
          "editor.invisible" = config.theme.hidden;
          "editor.wrap_guide" = "${config.theme.red}22";
          "editor.active_wrap_guide" = "${config.theme.red}44";
          "editor.indent_guide" = config.theme.hidden;
          "editor.indent_guide_active" = config.theme.muted;
          accents = [
            config.theme.base
            config.theme.overlay
          ];
          "editor.document_highlight.read_background" = "${config.theme.accent}22";
          "editor.document_highlight.write_background" = "${config.theme.accent}33";
          "editor.document_highlight.bracket_background" = "${config.theme.accent}33";

          "link_text.hover" = config.theme.blue-bright;

          error = config.theme.red;
          "error.background" = "${config.theme.red}22";
          "error.border" = "${config.theme.red}55";
          warning = config.theme.orange;
          "warning.background" = "${config.theme.orange}22";
          "warning.border" = "${config.theme.orange}55";
          info = config.theme.blue;
          "info.background" = "${config.theme.blue}22";
          "info.border" = "${config.theme.blue}55";
          hint = config.theme.teal;
          "hint.background" = "${config.theme.teal}22";
          "hint.border" = "${config.theme.teal}55";
          success = config.theme.green;
          "success.background" = "${config.theme.green}22";
          "success.border" = "${config.theme.green}55";
          predictive = config.theme.muted;
          "predictive.background" = "${config.theme.muted}22";
          "predictive.border" = "${config.theme.muted}55";
          renamed = config.theme.blue;
          "renamed.background" = "${config.theme.blue}22";
          "renamed.border" = "${config.theme.blue}55";
          unreachable = config.theme.subtext;
          "unreachable.background" = "${config.theme.subtext}22";
          "unreachable.border" = "${config.theme.subtext}55";

          created = config.theme.teal;
          "created.background" = "${config.theme.teal}22";
          "created.border" = "${config.theme.teal}55";
          modified = config.theme.purple;
          "modified.background" = "${config.theme.purple}22";
          "modified.border" = "${config.theme.purple}55";
          deleted = config.theme.red;
          "deleted.background" = "${config.theme.red}22";
          "deleted.border" = "${config.theme.red}55";
          conflict = config.theme.orange;
          "conflict.background" = "${config.theme.orange}22";
          "conflict.border" = "${config.theme.orange}55";
          ignored = config.theme.hidden;
          "ignored.background" = "${config.theme.hidden}22";
          "ignored.border" = "#00000000";
          hidden = config.theme.muted;
          "hidden.background" = "${config.theme.muted}22";
          "hidden.border" = "#00000000";

          "version_control.added" = config.theme.teal;
          "version_control.modified" = config.theme.purple;
          "version_control.deleted" = config.theme.red;
          "version_control.word_added" = "${config.theme.teal}59";
          "version_control.word_deleted" = "${config.theme.red}cc";

          "terminal.background" = config.theme.section;
          "terminal.foreground" = config.theme.text;
          "terminal.bright_foreground" = config.theme.text;
          "terminal.dim_foreground" = config.theme.subtext;
          "terminal.ansi.black" = config.theme.base;
          "terminal.ansi.red" = config.theme.red;
          "terminal.ansi.green" = config.theme.teal;
          "terminal.ansi.yellow" = config.theme.orange;
          "terminal.ansi.blue" = config.theme.blue;
          "terminal.ansi.magenta" = config.theme.purple;
          "terminal.ansi.cyan" = config.theme.cyan;
          "terminal.ansi.white" = config.theme.text;
          "terminal.ansi.bright_black" = config.theme.subtext;
          "terminal.ansi.bright_red" = config.theme.red-bright;
          "terminal.ansi.bright_green" = config.theme.green-bright;
          "terminal.ansi.bright_yellow" = config.theme.yellow-bright;
          "terminal.ansi.bright_blue" = config.theme.blue-bright;
          "terminal.ansi.bright_magenta" = config.theme.purple-bright;
          "terminal.ansi.bright_cyan" = config.theme.cyan-bright;
          "terminal.ansi.bright_white" = config.theme.text;
          "terminal.ansi.dim_black" = config.theme.section;
          "terminal.ansi.dim_red" = config.theme.red-dim;
          "terminal.ansi.dim_green" = config.theme.green-dim;
          "terminal.ansi.dim_yellow" = config.theme.yellow-dark;
          "terminal.ansi.dim_blue" = config.theme.blue-dim;
          "terminal.ansi.dim_magenta" = config.theme.purple-dim;
          "terminal.ansi.dim_cyan" = config.theme.cyan-dim;
          "terminal.ansi.dim_white" = config.theme.muted;

          players = [
            {
              cursor = config.theme.accent;
              background = config.theme.accent;
              selection = "${config.theme.accent}3d";
            }
            {
              cursor = config.theme.blue;
              background = config.theme.blue;
              selection = "${config.theme.blue}3d";
            }
            {
              cursor = config.theme.teal;
              background = config.theme.teal;
              selection = "${config.theme.teal}3d";
            }
            {
              cursor = config.theme.orange;
              background = config.theme.orange;
              selection = "${config.theme.orange}3d";
            }
          ];
        };
      };

      diagnostics = {
        inline = {
          enabled = true;
        };
      };

      git = {
        auto_fetch = {
          enabled = true;
        };
        date_format = "locale";
        inline_blame = {
          enabled = false;
        };
      };

      languages = {
        C = {
          auto_indent_on_paste = true;
          linked_edits = true;
          use_on_type_format = true;
          show_whitespaces = "trailing";
          format_on_save = "on";
          wrap_guides = [];
          language_servers = ["clangd"];
          formatter = {
            external = {
              command = "clang-format";
            };
          };
        };
        "C++" = {
          auto_indent_on_paste = true;
          linked_edits = true;
          use_on_type_format = true;
          show_whitespaces = "trailing";
          format_on_save = "on";
          wrap_guides = [];
          language_servers = ["clangd"];
          formatter = {
            external = {
              command = "clang-format";
            };
          };
        };
        CSS = {
          auto_indent_on_paste = true;
          linked_edits = true;
          use_on_type_format = true;
          show_whitespaces = "trailing";
          format_on_save = "on";
          wrap_guides = [];
          language_servers = ["vscode-css-language-server" "stylelint-lsp" "!tailwindcss-language-server"];
        };
        Dockerfile = {
          auto_indent_on_paste = true;
          linked_edits = true;
          use_on_type_format = true;
          show_whitespaces = "trailing";
          format_on_save = "on";
          wrap_guides = [];
          language_servers = ["dockerfile-language-server"];
        };
        Go = {
          auto_indent_on_paste = true;
          linked_edits = true;
          use_on_type_format = true;
          show_whitespaces = "trailing";
          format_on_save = "on";
          wrap_guides = [];
          language_servers = ["gopls"];
        };
        JSON = {
          auto_indent_on_paste = true;
          linked_edits = true;
          use_on_type_format = true;
          show_whitespaces = "trailing";
          format_on_save = "on";
          wrap_guides = [];
          language_servers = ["json-language-server"];
        };
        JavaScript = {
          auto_indent_on_paste = true;
          linked_edits = true;
          use_on_type_format = true;
          show_whitespaces = "trailing";
          format_on_save = "on";
          wrap_guides = [];
          language_servers = ["typescript-language-server" "eslint" "!vtsls"];
          formatter = {
            external = {
              arguments = ["--stdin-filepath" "{buffer_path}"];
              command = "prettier";
            };
          };
        };
        Lua = {
          auto_indent_on_paste = true;
          linked_edits = true;
          use_on_type_format = true;
          show_whitespaces = "trailing";
          format_on_save = "on";
          wrap_guides = [];
          language_servers = ["lua-language-server"];
        };
        Markdown = {
          auto_indent_on_paste = true;
          linked_edits = true;
          use_on_type_format = true;
          show_whitespaces = "trailing";
          format_on_save = "off";
          wrap_guides = [];
          language_servers = ["marksman"];
        };
        Nix = {
          auto_indent_on_paste = true;
          linked_edits = true;
          use_on_type_format = true;
          show_whitespaces = "trailing";
          format_on_save = "on";
          wrap_guides = [];
          language_servers = ["nixd" "!nil"];
          formatter = {
            external = {
              arguments = ["--quiet" "--"];
              command = "alejandra";
            };
          };
        };
        Python = {
          auto_indent_on_paste = true;
          linked_edits = true;
          use_on_type_format = true;
          show_whitespaces = "trailing";
          format_on_save = "on";
          wrap_guides = [];
          language_servers = ["basedpyright" "ruff"];
          formatter = {
            language_server = {
              name = "ruff";
            };
          };
        };
        Rust = {
          auto_indent_on_paste = true;
          linked_edits = true;
          use_on_type_format = true;
          show_whitespaces = "trailing";
          format_on_save = "on";
          wrap_guides = [];
          language_servers = ["rust-analyzer"];
        };
        SCSS = {
          auto_indent_on_paste = true;
          linked_edits = true;
          use_on_type_format = true;
          show_whitespaces = "trailing";
          format_on_save = "on";
          wrap_guides = [];
          language_servers = ["vscode-css-language-server" "stylelint-lsp" "!tailwindcss-language-server"];
        };
        "Shell Script" = {
          auto_indent_on_paste = true;
          linked_edits = true;
          use_on_type_format = true;
          show_whitespaces = "trailing";
          format_on_save = "on";
          wrap_guides = [];
          language_servers = ["bash-language-server"];
        };
        Svelte = {
          auto_indent_on_paste = true;
          linked_edits = true;
          use_on_type_format = true;
          show_whitespaces = "trailing";
          format_on_save = "on";
          wrap_guides = [];
          language_servers = ["svelte-language-server"];
        };
        TOML = {
          auto_indent_on_paste = true;
          linked_edits = true;
          use_on_type_format = true;
          show_whitespaces = "trailing";
          format_on_save = "on";
          wrap_guides = [];
          language_servers = ["taplo"];
        };
        TSX = {
          auto_indent_on_paste = true;
          linked_edits = true;
          use_on_type_format = true;
          show_whitespaces = "trailing";
          format_on_save = "on";
          wrap_guides = [];
          language_servers = ["typescript-language-server" "eslint" "!vtsls"];
          formatter = {
            external = {
              arguments = ["--stdin-filepath" "{buffer_path}"];
              command = "prettier";
            };
          };
        };
        TypeScript = {
          auto_indent_on_paste = true;
          linked_edits = true;
          use_on_type_format = true;
          show_whitespaces = "trailing";
          format_on_save = "on";
          wrap_guides = [];
          language_servers = ["typescript-language-server" "eslint" "!vtsls"];
          formatter = {
            external = {
              arguments = ["--stdin-filepath" "{buffer_path}"];
              command = "prettier";
            };
          };
        };
        YAML = {
          auto_indent_on_paste = true;
          linked_edits = true;
          use_on_type_format = true;
          show_whitespaces = "trailing";
          format_on_save = "on";
          wrap_guides = [];
          language_servers = ["yaml-language-server"];
        };
      };

      lsp = {
        nixd = {
          initialization_options = {
            options = {
              nixpkgs = {
                expr = "import (builtins.getFlake \"/mnt/nfs/${settings.username}/Projects/nix-configs/\").inputs.nixpkgs { }";
              };
              home-manager = {
                expr = "(builtins.getFlake \"/mnt/nfs/${settings.username}/Projects/nix-configs/\").homeConfigurations.\"${settings.username}@lain\".options";
              };
              nixos = {
                expr = "(builtins.getFlake \"/mnt/nfs/${settings.username}/Projects/nix-configs/\").nixosConfigurations.lain.options";
              };
            };
          };
        };
        basedpyright = {
          settings = {
            basedpyright = {
              analysis = {
                typeCheckingMode = "standard";
                diagnosticMode = "openFilesOnly";
              };
            };
          };
        };
        gopls = {
          settings = {
            gopls = {
              hints = {
                assignVariableTypes = true;
                compositeLiteralFields = true;
                compositeLiteralTypes = true;
                constantValues = true;
                functionTypeParameters = true;
                parameterNames = true;
                rangeVariableTypes = true;
              };
            };
          };
        };
      };

      terminal = {
        blinking = "on";
        cursor_shape = "bar";
        env = {};
        font_family = config.theme.fontMonospace;
        font_size = 14;
        shell = "system";
      };
    };

    userKeymaps = [
      {
        context = "Workspace";
        bindings = {
          "ctrl-o" = "file_finder::Toggle";
          "ctrl-shift-o" = "projects::OpenRecent";
          "ctrl-s" = "workspace::Save";
          "ctrl-shift-s" = "workspace::SaveAs";
          "ctrl-p" = "command_palette::Toggle";
          "ctrl-shift-e" = "workspace::ToggleLeftDock";
          "ctrl-f" = "buffer_search::Deploy";
          "ctrl-shift-f" = "pane::DeploySearch";
          "ctrl-h" = "buffer_search::DeployReplace";
          "ctrl-shift-h" = "pane::DeploySearch";
          "ctrl-g" = "go_to_line::Toggle";
          "ctrl-shift-g" = "outline::Toggle";
          "ctrl-/" = "editor::ToggleComments";
          "ctrl-`" = "terminal_panel::ToggleFocus";
        };
      }
      {
        context = "Editor";
        bindings = {
          "ctrl-o" = "file_finder::Toggle";
          "ctrl-shift-p" = "command_palette::Toggle";
          "ctrl-space" = "editor::ShowCompletions";
          "ctrl-shift-i" = "editor::Format";
          "f12" = "editor::GoToDefinition";
          "shift-f12" = "editor::FindAllReferences";
          "alt-f12" = "editor::GoToDefinitionSplit";
          "f8" = "editor::GoToDiagnostic";
          "shift-f8" = "editor::GoToPreviousDiagnostic";
          "ctrl-d" = "editor::SelectNext";
          "ctrl-shift-k" = "editor::DeleteLine";
          "ctrl-enter" = "editor::NewlineBelow";
          "ctrl-shift-enter" = "editor::NewlineAbove";
          "ctrl-up" = ["editor::MoveUpByLines" {lines = 4;}];
          "ctrl-down" = ["editor::MoveDownByLines" {lines = 4;}];
          "ctrl-shift-up" = ["editor::SelectUpByLines" {lines = 4;}];
          "ctrl-shift-down" = ["editor::SelectDownByLines" {lines = 4;}];
        };
      }
      {
        context = "Pane";
        bindings = {
          "ctrl-o" = "file_finder::Toggle";
          "ctrl-shift-p" = "command_palette::Toggle";
        };
      }
      {
        context = "ProjectPanel";
        bindings = {
          "ctrl-o" = "file_finder::Toggle";
          "ctrl-shift-p" = "command_palette::Toggle";
        };
      }
    ];
  };
}
