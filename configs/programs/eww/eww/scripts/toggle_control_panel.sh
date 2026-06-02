#!/usr/bin/env bash
if eww get control_panel_active | grep -q "true"; then
  eww close control_panel
  eww update control_panel_active=false
else
  eww open control_panel
  eww update control_panel_active=true
fi

if eww get notification_panel_active | grep -q "true"; then
  eww close notification_panel
  eww update notification_panel_active=false
fi

