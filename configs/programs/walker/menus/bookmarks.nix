{
  config,
  pkgs,
  ...
}: let
  focus-command = ''
    sleep 0.1 && \
    current_id="$(niri msg --json focused-window | jq -r '.id')" && \
    current_app="$(niri msg --json windows | jq -r --arg id "$current_id" '.[] | select(.id == ($id|tonumber)) | .app_id')" && \
    [ "$current_app" = "vivaldi-stable" ] || \
    niri msg action focus-window --id "$(
      niri msg --json windows \
        | jq -r '.[] | select(.app_id == "vivaldi-stable") | .id' \
        | head -n 1
    )"
  '';
in {
  home.packages = [pkgs.jq];

  programs.elephant.provider.menus.toml."Bookmarks" = {
    name = "bookmarks";
    name_pretty = "Bookmarks";
    icon = "bookmarks-symbolic";
    entries = [
      {
        text = "Youtube";
        icon = "/home/riaru/.config/elephant/icons/youtube.svg";
        keywords = ["youtube" "yt"];
        actions = {open = "xdg-open https://www.youtube.com/feed/subscriptions && ${focus-command}";};
      }
      {
        text = "Online Fix";
        icon = "/home/riaru/.config/elephant/icons/online-fix.svg";
        keywords = ["online fix"];
        actions = {open = "xdg-open https://online-fix.me/ && ${focus-command}";};
      }
      {
        text = "Jellyfin";
        icon = "/home/riaru/.config/elephant/icons/jellyfin.svg";
        keywords = ["jellyfin"];
        actions = {open = "xdg-open https://riaru.undo.it/web && ${focus-command}";};
      }
      {
        text = "Github";
        icon = "/home/riaru/.config/elephant/icons/github.svg";
        keywords = ["gh" "github" "git"];
        actions = {open = "xdg-open https://github.com && ${focus-command}";};
      }
      {
        text = "Mastodon";
        icon = "/home/riaru/.config/elephant/icons/mastodon.svg";
        keywords = ["mastodon" "void" "my void"];
        actions = {open = "xdg-open https://my.v0id.nl && ${focus-command}";};
      }
      {
        text = "Void";
        icon = "/home/riaru/.config/elephant/icons/void.png";
        keywords = ["mastodon" "void" "my void"];
        actions = {open = "xdg-open https://my.v0id.nl && ${focus-command}";};
      }
      {
        text = "Lemmy";
        icon = "/home/riaru/.config/elephant/icons/lemmy.svg";
        keywords = ["lemmy" "phtn"];
        actions = {open = "xdg-open https://phtn.app/?type=Subscribed && ${focus-command}";};
      }
      {
        text = "Anilist";
        icon = "/home/riaru/.config/elephant/icons/anilist.svg";
        keywords = ["anilist" "list" "ani"];
        actions = {open = "xdg-open https://anilist.co/user/Riaru/animelist && ${focus-command}";};
      }
      {
        text = "Proton";
        icon = "/home/riaru/.config/elephant/icons/proton.svg";
        keywords = ["proton" "mail"];
        actions = {open = "xdg-open https://mail.proton.me/u/1/inbox && ${focus-command}";};
      }
      {
        text = "Claude";
        icon = "/home/riaru/.config/elephant/icons/claude.svg";
        keywords = ["claude" "ai"];
        actions = {open = "xdg-open https://claude.ai/new && ${focus-command}";};
      }
      {
        text = "ChatGPT";
        icon = "/home/riaru/.config/elephant/icons/chatgpt.svg";
        keywords = ["chatgpt" "ai"];
        actions = {open = "xdg-open https://chatgpt.com && ${focus-command}";};
      }
      {
        text = "Gemini";
        icon = "/home/riaru/.config/elephant/icons/gemini.svg";
        keywords = ["gemini" "ai"];
        actions = {open = "xdg-open https://gemini.google.com/app && ${focus-command}";};
      }
      {
        text = "Letterboxd";
        icon = "/home/riaru/.config/elephant/icons/letterboxd.svg";
        keywords = ["letterboxd" "movies" "movie"];
        actions = {open = "xdg-open https://letterboxd.com/riaru/films/by/entry-rating/ && ${focus-command}";};
      }
      {
        text = "Dashboard";
        icon = "x-office-calendar";
        keywords = ["dashboard" "school"];
        actions = {open = "xdg-open $(cat '${config.sops.secrets.dashboard_url.path}') && ${focus-command}";};
      }
      {
        text = "Google Docs";
        icon = "/home/riaru/.config/elephant/icons/google-docs.svg";
        keywords = ["docs"];
        actions = {open = "xdg-open https://docs.google.com/document/u/0/ && ${focus-command}";};
      }
      {
        text = "Google Slides";
        icon = "/home/riaru/.config/elephant/icons/google-slides.svg";
        actions = {open = "xdg-open https://docs.google.com/presentation/u/0/ && ${focus-command}";};
      }
      {
        text = "Google Drive";
        icon = "/home/riaru/.config/elephant/icons/google-drive.svg";
        keywords = ["cloud" "drive"];
        actions = {open = "xdg-open https://drive.google.com/drive/u/0/home && ${focus-command}";};
      }
      {
        text = "Word";
        icon = "/home/riaru/.config/elephant/icons/ms-word.svg";
        keywords = ["docs"];
        actions = {open = "xdg-open https://word.cloud.microsoft/ && ${focus-command}";};
      }
      {
        text = "Miruro";
        icon = "/home/riaru/.config/elephant/icons/miruro.svg";
        keywords = ["anime"];
        actions = {open = "xdg-open https://www.miruro.to/ && ${focus-command}";};
      }
      {
        text = "unicode";
        icon = "/home/riaru/.config/elephant/icons/unicode.svg";
        actions = {open = "xdg-open 'https://charcuterie.elastiq.ch/#1F5C5' && ${focus-command}";};
      }
      {
        text = "Penpot";
        icon = "/home/riaru/.config/elephant/icons/penpot.svg";
        actions = {open = "xdg-open 'https://design.penpot.app/' && ${focus-command}";};
      }
      {
        text = "cs rin ru";
        icon = "/home/riaru/.config/elephant/icons/csrin.svg";
        actions = {open = "xdg-open 'https://cs.rin.ru/forum/' && ${focus-command}";};
      }
      {
        text = "fmhy";
        icon = "/home/riaru/.config/elephant/icons/fmhy.svg";
        actions = {open = "xdg-open 'https://fmhy.net' && ${focus-command}";};
      }
      {
        text = "Pinterest";
        icon = "/home/riaru/.config/elephant/icons/pinterest.svg";
        actions = {open = "xdg-open 'https://ca.pinterest.com' && ${focus-command}";};
      }
      {
        text = "Mail";
        icon = "/home/riaru/.config/elephant/icons/mail.svg";
        keywords = ["mail" "nextcloud"];
        actions = {open = "xdg-open https://riaru.home.kg/apps/mail/box/unified && ${focus-command}";};
      }
      {
        text = "Files";
        icon = "/home/riaru/.config/elephant/icons/files.svg";
        keywords = ["files" "drive"];
        actions = {open = "xdg-open https://riaru.home.kg/apps/files/files && ${focus-command}";};
      }
      {
        text = "Calendar";
        icon = "/home/riaru/.config/elephant/icons/calendar.svg";
        actions = {open = "xdg-open https://riaru.home.kg/apps/calendar/timeGridWeek/now && ${focus-command}";};
      }
      {
        text = "Contacts";
        icon = "/home/riaru/.config/elephant/icons/contacts.svg";
        actions = {open = "xdg-open 'https://riaru.home.kg/apps/contacts/All%20contacts' && ${focus-command}";};
      }
      {
        text = "Nextcloud Settings";
        icon = "/home/riaru/.config/elephant/icons/nextcloud-settings.svg";
        keywords = ["settings" "nextcloud"];
        actions = {open = "xdg-open https://riaru.home.kg/settings/user && ${focus-command}";};
      }
    ];
  };
}
