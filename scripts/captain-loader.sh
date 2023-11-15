#!/bin/bash

options=("WEB + VPN"
         "WEB + VPN + AUD"
         "WEB + VPN + CHAT"
         "WEB + VPN + CHAT + AUD"
         "WEB + VPN + TERM + IDE + AUD"
         "WEB + VPN + TERM + IDE"
         "CHAT + VPN + AUD"
         "WEB + VPN + TERM"
         "WEB + VPN + IDE"
         "CHAT + VPN")

chosen_option=$(printf "%s\n" "${options[@]}" | rofi -dmenu -p "Welcome Back Captain. What shall i do?")

case $chosen_option in
      "WEB + VPN")
        brave & 
        kdesu ~/Apps/nekoray/nekoray &
        ;;

      "WEB + VPN + AUD")
        brave & 
        kdesu ~/Apps/nekoray/nekoray &
        spotify-launcher &
        ;;

      "WEB + VPN + CHAT")
        brave & 
        kdesu ~/Apps/nekoray/nekoray &
        telegram-desktop &
        ;;

      "WEB + VPN + CHAT + AUD")
        brave & 
        kdesu ~/Apps/nekoray/nekoray &
        telegram-desktop &
        spotify-launcher &
        ;;

      "WEB + VPN + TERM + IDE + AUD")
        brave & 
        kdesu ~/Apps/nekoray/nekoray &
        alacritty &
        emacs &
        spotify-launcher &
        ;;

      "WEB + VPN + TERM + IDE")
        brave & 
        kdesu ~/Apps/nekoray/nekoray &
        alacritty &
        emacs &
        ;;

      "CHAT + VPN + AUD")
        telegram-desktop &
        kdesu ~/Apps/nekoray/nekoray &
        spotify-launcher &
        ;;

      "WEB + VPN + TERM")
        brave &
        kdesu ~/Apps/nekoray/nekoray &
        alacritty &
        ;;

      "WEB + VPN + IDE")
        brave & 
        kdesu ~/Apps/nekoray/nekoray &
        emacs &
        ;;

      "CHAT + VPN")
        telegram-desktop &
        kdesu ~/Apps/nekoray/nekoray &
        ;;
esac
