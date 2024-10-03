{ pkgs, config, ... }:

let
  devPackages = with pkgs; [
    # CLI
    zsh
    zsh-completions
    zsh-autosuggestions
    zsh-syntax-highlighting
    fzf
    tmux
    ripgrep
    silver-searcher
    ctags
    alacritty

    # Text Editors
    neovim
    emacs

    # Version Control
    git
    gh
    lazygit
    tig

    # Virtualization
    docker-compose

    # Compilers & Runtimes
    gcc
    gnumake
    cmake

    lua
    luajit
    luajitPackages.luarocks

    go

    cargo
    rustc
    rustup
    rustfmt

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
    obs-studio
    shutter
    evince
    libsForQt5.okular

    # Files
    pcmanfm

    # Audio
    pavucontrol

    # Downloader
    uget
    transmission
    yt-dlp

    # Password Manager
    keepassxc

    # Creativity & Office
    gimp
    libreoffice
    obsidian

    # Proxies, VPNs & V2ray
    tor
    torsocks
    tor-browser
    nekoray
    sshuttle
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

    # UI & Appearance
    polybar
    rofi
    dmenu
    picom
    lxappearance
    gnome.gnome-tweaks

    # Keybindings
    sxhkd

    # Archives
    gnutar
    gzip
    rar
    unrar
    unzip
    gnome.file-roller

    # Network & Audio
    networkmanagerapplet
    alsa-utils
    playerctl

    # Wine
    wineWowPackages.stable
    winetricks

    # Partitioning
    gparted

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
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    histSize = 10000;
  };

  environment.systemPackages = devPackages ++ apps ++ utils;
}
