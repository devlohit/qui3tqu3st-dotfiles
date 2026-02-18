#!/bin/zsh

LAPTOP="eDP-1"

# Check if laptop screen is currently enabled
if hyprctl monitors | grep -q "$LAPTOP"; then
  # Laptop is enabled, disable it
  hyprctl keyword monitor "$LAPTOP,disable"
  # notify-send "Laptop Screen" "Disabled" -i display-brightness-off
else
  # Laptop is disabled, enable it and render it to left of external
  hyprctl keyword monitor "$LAPTOP,highrr,auto,1"
  # notify-send "Laptop Screen" "Enabled" -i display-brightness
fi
