import os
import subprocess

from gi.repository import GObject, Nautilus

VSCODE_BIN = "codium"
VSCODE_LABEL = "Open in Codium"


class VSCodiumExtension(GObject.GObject, Nautilus.MenuProvider):
    def _launch(self, _menu, files, new_window):
        args = [VSCODE_BIN]
        has_folder = False

        for file_ in files:
            location = file_.get_location()
            if location is None or location.get_path() is None:
                continue
            path = location.get_path()
            args.append(path)
            if os.path.isdir(path):
                has_folder = True

        if new_window or has_folder:
            args.insert(1, "--new-window")

        if len(args) > 1:
            subprocess.Popen(args, start_new_session=True)

    def _item(self, name, label, tip, files, new_window=False):
        item = Nautilus.MenuItem(name=name, label=label, tip=tip)
        item.connect("activate", self._launch, list(files), new_window)
        return item

    def _has_folder(self, files):
        for file_ in files:
            location = file_.get_location()
            if (
                location is not None
                and location.get_path() is not None
                and os.path.isdir(location.get_path())
            ):
                return True
        return False

    def get_file_items(self, files):
        items = [
            self._item(
                "VSCodiumExtension::open",
                VSCODE_LABEL,
                "Open the selected files with Codium",
                files,
            )
        ]
        if self._has_folder(files):
            items.append(
                self._item(
                    "VSCodiumExtension::open-new-window",
                    VSCODE_LABEL + " (New Window)",
                    "Open the selected files in a new Codium window",
                    files,
                    new_window=True,
                )
            )
        return items

    def get_background_items(self, current_folder):
        return [
            self._item(
                "VSCodiumExtension::open-background",
                VSCODE_LABEL,
                "Open the current folder with Codium",
                [current_folder],
            )
        ]
