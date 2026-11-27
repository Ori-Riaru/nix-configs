import os
import subprocess

from gi.repository import GObject, Nautilus

ZED_BIN = "zeditor"
ZED_LABEL = "Open in Zed"


class ZedExtension(GObject.GObject, Nautilus.MenuProvider):
    def _launch(self, _menu, files, new_window):
        args = [ZED_BIN]
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
            args.insert(1, "--new")

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
                "ZedExtension::open",
                ZED_LABEL,
                "Open the selected files with Zed",
                files,
            )
        ]
        if self._has_folder(files):
            items.append(
                self._item(
                    "ZedExtension::open-new-window",
                    ZED_LABEL + " (New Window)",
                    "Open the selected files in a new Zed window",
                    files,
                    new_window=True,
                )
            )
        return items

    def get_background_items(self, current_folder):
        return [
            self._item(
                "ZedExtension::open-background",
                ZED_LABEL,
                "Open the current folder with Zed",
                [current_folder],
            )
        ]
