{ pkgs, config, ... }:

let
  devPackages = with pkgs; [
    # Dev
    neovim
    emacs
    silver-searcher
    ripgrep
    ctags
    fzf

    # SHELL & term tools
    zsh
    tmux

    # Virtualization
    docker-compose

    # Version Control
    git
    gh
    lazygit
    tig

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

    nodejs_20
    nodePackages.npm
    nodePackages.prettier
    nodePackages.typescript
    nodePackages.ts-node
    nodePackages.typescript-language-server

    python311
    python311Packages.pip
  ];

  apps = with pkgs; [
    # Suckless
    dmenu

    (st.overrideAttrs (oldAttrs: rec {
      src = /home/x/xfiles/st;
    }))

    (slstatus.overrideAttrs (oldAttrs: rec {
      src = /home/x/xfiles/slstatus;
    }))

    # Web Browsers
    firefox
    brave
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

    # Password Manager
    keepassxc

    # Tools & Office
    gimp
    libreoffice

    # Proxies, VPNs & V2ray
    putty
    proxychains
    sshuttle
    shadowsocks-rust
    sing-box
    xray
  ];

  utils = with pkgs; [
    steam-run
    appimage-run
    neofetch
    stow
    lsd
    htop
    picom
    rofi
    curl
    wget
    file
    catimg
    figlet
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

    # wine
    wineWowPackages.stable
    winetricks

    # X stuff
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
  # Packages
  environment.systemPackages = devPackages ++ apps ++ utils;

  programs.steam.enable = true;
  programs.steam = {
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  };

  hardware.steam-hardware.enable = true;
  hardware.opengl.driSupport32Bit = true; # Enables support for 32bit libs that steam uses

  programs.gamemode.enable = true;

}
