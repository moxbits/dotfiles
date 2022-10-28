# basic apps installer
#
# distro support:
# - ubuntu
#

# getting distro info
if [ -f /etc/os-release ]; then
    # freedesktop.org and systemd
    . /etc/os-release
    OS=$NAME
    VER=$VERSION_ID
else
    # Fall back to uname, e.g. "Linux <version>", also works for BSD, etc.
    OS=$(uname -s)
    VER=$(uname -r)
fi


# ubuntu
if ["$OS" == "Ubuntu"]; then

  # updating repos
  apt update
  apt upgrade -y

  # installing basic useful tools
  apt install -y vim neovim git build-essential curl wget zsh tmux

  # installing alacritty

  # installing oh-my-zsh

  # installing nodejs

  # installing rust lang stuff

  # start: installing useful apps

  # brave browser

  # spotify

  # telegram

  # end: installing useful apps

fi

