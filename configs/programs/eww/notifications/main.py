# notifications/main.py
#!/usr/bin/env python3
import dbus
import dbus.service
from dbus.mainloop.glib import DBusGMainLoop
from gi.repository import GLib
import threading
import time
import html

class Notification:
    def __init__(self, summary, body, icon):
        self.summary = summary
        self.body = body
        self.icon = icon

notifications = []

def remove_object(notif):
    time.sleep(10)
    try:
        notifications.remove(notif)
        print_state()
    except ValueError:
        pass  # Already removed

def add_object(notif):
    notifications.insert(0, notif)
    print_state()
    timer_thread = threading.Thread(target=remove_object, args=(notif,), daemon=True)
    timer_thread.start()

def escape_text(text):
    """Escape text for safe use in eww widgets"""
    if not text:
        return ""
    # HTML escape and remove problematic characters
    escaped = html.escape(str(text))
    # Remove newlines and quotes that could break eww syntax
    escaped = escaped.replace('\n', ' ').replace('\r', ' ')
    escaped = escaped.replace("'", "&#39;").replace('"', "&#34;")
    return escaped

def print_state():
    widgets = []
    for item in notifications:
        summary = escape_text(item.summary)
        body = escape_text(item.body)
        icon_path = escape_text(item.icon) if item.icon else ""
        
        widget = f"""(button :class "notif"
            (box :orientation "horizontal" :space-evenly false
                {f'(image :image-width 80 :image-height 80 :path "{icon_path}")' if icon_path else ''}
                (box :orientation "vertical"
                    (label :width 100 :wrap true :text "{summary}")
                    (label :width 100 :wrap true :text "{body}")
                )
            )
        )"""
        widgets.append(widget)
    
    result = f"(box :orientation \"vertical\" {' '.join(widgets)})"
    print(result, flush=True)

class NotificationServer(dbus.service.Object):
    def __init__(self):
        bus_name = dbus.service.BusName('org.freedesktop.Notifications', bus=dbus.SessionBus())
        dbus.service.Object.__init__(self, bus_name, '/org/freedesktop/Notifications')

    @dbus.service.method('org.freedesktop.Notifications', 
                        in_signature='susssasa{ss}i', 
                        out_signature='u')
    def Notify(self, app_name, replaces_id, app_icon, summary, body, actions, hints, timeout):
        add_object(Notification(summary, body, app_icon))
        return 1  # Return a valid notification ID

    @dbus.service.method('org.freedesktop.Notifications', out_signature='ssss')
    def GetServerInformation(self):
        return ("Custom Notification Server", "ExampleNS", "1.0", "1.2")

    @dbus.service.method('org.freedesktop.Notifications', in_signature='u')
    def CloseNotification(self, notification_id):
        pass  # Implement if needed

    @dbus.service.method('org.freedesktop.Notifications', out_signature='as')
    def GetCapabilities(self):
        return ["body", "icon-static"]

if __name__ == '__main__':
    DBusGMainLoop(set_as_default=True)
    server = NotificationServer()
    
    # Print initial empty state
    print_state()
    
    try:
        mainloop = GLib.MainLoop()
        mainloop.run()
    except KeyboardInterrupt:
        print("Shutting down notification server...")
        mainloop.quit()