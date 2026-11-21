import os
import subprocess

from gi.repository import GObject, Nautilus

GHOSTTY_BIN = "ghostty"
GHOSTTY_LABEL = "Open in Ghostty"


class GhosttyExtension(GObject.GObject, Nautilus.MenuProvider):
    def _paths(self, files):
        paths = []
        for file_ in files:
            location = file_.get_location()
            if location is None or location.get_path() is None:
                continue
            path = location.get_path()
            if not os.path.isdir(path):
                path = os.path.dirname(path)
            if path and path not in paths:
                paths.append(path)
        return paths

    def _launch(self, _menu, files):
        for path in self._paths(files):
            subprocess.Popen(
                [GHOSTTY_BIN, f"--working-directory={path}"],
                start_new_session=True,
            )

    def _item(self, name, label, tip, files):
        item = Nautilus.MenuItem(name=name, label=label, tip=tip)
        item.connect("activate", self._launch, list(files))
        return item

    def get_file_items(self, files):
        if not self._paths(files):
            return []
        return [
            self._item(
                "GhosttyExtension::open",
                GHOSTTY_LABEL,
                "Open the selected folder in Ghostty",
                files,
            )
        ]

    def get_background_items(self, current_folder):
        return [
            self._item(
                "GhosttyExtension::open-background",
                GHOSTTY_LABEL,
                "Open the current folder in Ghostty",
                [current_folder],
            )
        ]
