{
  pkgs,
  settings,
  ...
}: {
  home.packages = with pkgs; [
    zenity
    (pkgs.writeShellScriptBin "create-starter" ''
      template="$1"
      shift || true
      configPath="${settings.configPath}"
      projectsPath="/mnt/nfs/riaru/Projects"

      no_git_flag=""
      no_open_flag=""
      while [ "$#" -gt 0 ]; do
        case "$1" in
          --no-git) no_git_flag="1" ;;
          --no-open) no_open_flag="1" ;;
          *) notify-send "Create" "Unknown option: $1"; exit 1 ;;
        esac
        shift
      done

      if [ -z "$template" ]; then
        notify-send "Create" "Usage: create-starter <template> [--no-git] [--no-open]"
        exit 1
      fi

      name=$(zenity --entry --title "Create ''${template} project" --text "Project name:" --width 400)
      if [ -z "$name" ]; then
        exit 0
      fi

      case "$name" in
        */* | *' '*) notify-send "Create" "Invalid name: must be a single word without spaces or slashes"; exit 1 ;;
      esac

      if [ -e "$projectsPath/$name" ]; then
        notify-send "Create" "File or directory ''${name} already exists"
        exit 1
      fi

      mkdir -p "$projectsPath/$name" || exit 1
      cd "$projectsPath/$name" || exit 1

      if ! nix flake init --template "$configPath#''${template}"; then
        notify-send "Create" "Failed to create project ''${name}"
        exit 1
      fi

      git_msg=""
      if [ -z "$no_git_flag" ]; then
        git init -q
        git add -A
        git commit -qm "Initial commit"
        git_msg=" with git repo"
      fi

      notify-send "Create" "Created ''${name} (''${template})''${git_msg}"

      if [ -z "$no_open_flag" ]; then
        codium "$projectsPath/$name" &
      fi
    '')

    (pkgs.writeShellScriptBin "create-empty" ''
      projectsPath="/mnt/nfs/riaru/Projects"

      name=$(zenity --entry --title "Create empty project" --text "Project name:" --width 400)
      if [ -z "$name" ]; then
        exit 0
      fi

      case "$name" in
        */* | *' '*) notify-send "Create" "Invalid name: must be a single word without spaces or slashes"; exit 1 ;;
      esac

      if [ -e "$projectsPath/$name" ]; then
        notify-send "Create" "File or directory ''${name} already exists"
        exit 1
      fi

      mkdir -p "$projectsPath/$name" || exit 1

      notify-send "Create" "Created empty project ''${name}"
      nautilus "$projectsPath/$name" &
    '')
  ];

  programs.walker.config.providers.actions = let
    createActions = [
      {
        action = "open";
        label = "Create";
        bind = "Return";
      }
    ];
  in {
    "menus:createPython" = createActions;
    "menus:createWeb" = createActions;
    "menus:createCpp" = createActions;
    "menus:createR" = createActions;
  };

  programs.elephant.provider.menus = {
    lua.create = ''
      Name = "create"
      NamePretty = "Create"
      Icon = "document-new"
      HideFromProviderlist = false
      Cache = true
      SearchName = true

      local function menu_entry(text, icon, submenu, keywords)
          return {
              Text = text,
              Icon = icon,
              SubMenu = submenu,
              Keywords = keywords,
          }
      end

      local function create_entry(command, text, subtext, icon, keywords)
          return {
              Text = text,
              Subtext = subtext,
              Icon = icon,
              Keywords = keywords,
              Actions = {
                  open = command,
              },
          }
      end

      function GetEntries()
          return {
              menu_entry("Python", "text-x-python", "createPython", { "create", "python", "py", "project", "starter", "template" }),
              menu_entry("Web / JS", "text-html", "createWeb", { "create", "web", "html", "javascript", "typescript", "ts", "node", "bun", "project" }),
              menu_entry("C / C++", "text-x-c++src", "createCpp", { "create", "c", "c++", "cpp", "kernel", "opengl", "gl", "project" }),
              menu_entry("R", "text-x-r", "createR", { "create", "r", "notebook", "project" }),
              create_entry("create-empty", "Empty Project", "Create empty folder", "folder-new", { "create", "empty", "blank", "folder", "directory", "project", "new" }),
              create_entry("create-starter rust", "Rust Project", "create-starter: rust", "rust", { "create", "rust", "cargo", "project", "starter", "template" }),
              create_entry("create-starter go", "Go Project", "create-starter: go", "text-x-script", { "create", "go", "golang", "project", "starter", "template" }),
              create_entry("create-starter zig", "Zig Project", "create-starter: zig", "text-x-script", { "create", "zig", "project", "starter", "template" }),
              create_entry("create-starter java", "Java Project", "create-starter: java", "text-x-java", { "create", "java", "project", "starter", "template" }),
              create_entry("create-starter bash", "Bash Script", "create-starter: bash", "text-x-script", { "create", "bash", "shell", "script", "starter", "template" }),
              create_entry("create-starter godot --no-open", "Godot Project", "create-starter: godot", "application-x-executable", { "create", "godot", "game", "gdscript", "project", "starter", "template" }),
          }
      end
    '';

    toml = {
      createPython = {
        name = "createPython";
        name_pretty = "Python";
        parent = "create";
        hide_from_providerlist = true;
        icon = "text-x-python";
        entries = [
          {
            text = "Python Project";
            keywords = ["create" "python" "py" "project" "starter" "template"];
            icon = "text-x-python";
            actions = {
              "open" = "create-starter python";
            };
          }
          {
            text = "Python Notebook";
            keywords = ["create" "python" "jupyter" "notebook" "project" "starter"];
            icon = "text-x-python";
            actions = {
              "open" = "create-starter python-notebook";
            };
          }
          {
            text = "Python Venv";
            keywords = ["create" "python" "venv" "virtualenv" "project" "starter"];
            icon = "text-x-python";
            actions = {
              "open" = "create-starter python-venv";
            };
          }
        ];
      };

      createWeb = {
        name = "createWeb";
        name_pretty = "Web / JS";
        parent = "create";
        hide_from_providerlist = true;
        icon = "text-html";
        entries = [
          {
            text = "Web Project";
            keywords = ["create" "web" "html" "javascript" "node" "js" "project" "starter" "template"];
            icon = "text-html";
            actions = {
              "open" = "create-starter web";
            };
          }
          {
            text = "TypeScript Project";
            keywords = ["create" "typescript" "ts" "bun" "project" "starter" "template"];
            icon = "text-x-typescript";
            actions = {
              "open" = "create-starter typescript";
            };
          }
        ];
      };

      createCpp = {
        name = "createCpp";
        name_pretty = "C / C++";
        parent = "create";
        hide_from_providerlist = true;
        icon = "text-x-c++src";
        entries = [
          {
            text = "C Project";
            keywords = ["create" "c" "project" "starter" "template"];
            icon = "text-x-csrc";
            actions = {
              "open" = "create-starter c";
            };
          }
          {
            text = "C++ Project";
            keywords = ["create" "c++" "cpp" "project" "starter" "template"];
            icon = "text-x-c++src";
            actions = {
              "open" = "create-starter cpp";
            };
          }
          {
            text = "Kernel Module";
            keywords = ["create" "kernel" "linux" "module" "c" "project" "starter"];
            icon = "application-x-executable";
            actions = {
              "open" = "create-starter kernel-module";
            };
          }
          {
            text = "OpenGL Project";
            keywords = ["create" "opengl" "gl" "graphics" "project" "starter"];
            icon = "application-x-executable";
            actions = {
              "open" = "create-starter opengl";
            };
          }
        ];
      };

      createR = {
        name = "createR";
        name_pretty = "R";
        parent = "create";
        hide_from_providerlist = true;
        icon = "text-x-r";
        entries = [
          {
            text = "R Project";
            keywords = ["create" "r" "project" "starter" "template"];
            icon = "text-x-r";
            actions = {
              "open" = "create-starter r";
            };
          }
          {
            text = "R Notebook";
            keywords = ["create" "r" "notebook" "project" "starter" "template"];
            icon = "text-x-r";
            actions = {
              "open" = "create-starter r-notebook";
            };
          }
        ];
      };
    };
  };
}
