hosts=($(grep "^Host " ~/.ssh/config | cut -d' ' -f2))

chosen_option=$(printf "%s\n" "${hosts[@]}" | rofi -dmenu -p "Choose which one to ssh")

alacritty -e ssh $chosen_option
