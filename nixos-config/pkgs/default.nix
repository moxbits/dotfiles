{ pkgs, config, ... }:

let
  devPackages = with pkgs; [
    # CLI
    zsh
    tmux
    fzf
    ripgrep
    silver-searcher
    ctags

    # Text Editors
    neovim
    #emacs

    # Version Control
    git
    gh
    lazygit
    tig

    # Virtualization
    docker-compose

    # Compilers & Runtimes
    #gcc
    #gnumake
    #cmake

    lua
    luajit
    luajitPackages.luarocks

    go

    #cargo
    #rustc
    #rustup
    #rustfmt

    nodejs
    nodePackages.npm
    nodePackages.prettier
    nodePackages.typescript
    nodePackages.ts-node
    nodePackages.typescript-language-server

    python311
    python311Packages.pip
  ];

  apps = with pkgs; [
    # Web Browsers
    firefox
    chromium

    # Communication
    telegram-desktop

    # Media
    gnome.eog
    vlc
    feh
    #obs-studio
    shutter
    evince
    #libsForQt5.okular

    # Files
    gnome.nautilus

    # Audio
    pavucontrol

    # Downloader
    uget

    # Password Manager
    keepassxc

    # Creativity & Office
    #gimp
    #libreoffice

    # Proxies, VPNs & V2ray
    nekoray
    sshuttle

    # Extra
    dmenu
    picom
    rofi
  ];

  utils = with pkgs; [
    # NixOS related
    home-manager

    # CLI
    neofetch
    htop
    curl
    wget
    lsd
    stow
    figlet
    catimg
    file
    appimage-run

    # Appearance
    lxappearance
    gnome.gnome-tweaks

    # Archives
    gnutar
    gzip
    rar
    unrar
    unzip
    gnome.file-roller

    # Network & Audio & Light
    networkmanagerapplet
    alsa-utils
    pavucontrol
    light

    # Wine
    #wineWowPackages.stable
    #winetricks

    # Display stuff
    arandr
    brightnessctl
    xorg.xhost
    xorg.xinit
    xorg.xrandr
    xorg.xbacklight
    xorg.xmodmap
    xorg.xkill
    xclip
    xdo
    xdotool
    v4l-utils
  ];
in
{
  nixpkgs.config.allowUnfree = true;

  programs.firefox.enable = true;

  programs.zsh = {
    enable = true;
    histSize = 10000;
  };

  environment.systemPackages = devPackages ++ apps ++ utils;
}
