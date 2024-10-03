#!/bin/sh

options="Shutdown\nReboot"

choice=$(echo -e "$options" | rofi -dmenu -p "Choose an action")

case "$choice" in
    Shutdown)
        systemctl poweroff
        ;;
    Reboot)
        reboot
        ;;
    *)
        exit 1
        ;;
esac

