#!/bin/bash

options=(
  "WEB + VPN"
  "WEB + VPN + AUD"
  "WEB + VPN + CHAT"
  "WEB + VPN + CHAT + AUD"
  "WEB + VPN + TERM + IDE + AUD"
  "WEB + VPN + TERM + IDE"
  "CHAT + VPN + AUD"
  "WEB + VPN + TERM"
  "WEB + VPN + IDE"
  "CHAT + VPN"
)

# Use Rofi to display and run the selected script.
chosen_option=$(echo "$options" | rofi -dmenu -p "Run Script")

# Run the selected script.
if [ -n "$CHOSEN_SCRIPT" ]; then
    bash "$CHOSEN_SCRIPT"
fi
