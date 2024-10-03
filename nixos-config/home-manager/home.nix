{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [ 
    ./appearance.nix
  ];

  nixpkgs = {
    overlays = [ ];

    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
  };

  home = {
    username = "xac";
    homeDirectory = "/home/xac";

    file = {
      "scripts".source = ~/dotfiles/scripts;
      ".profile".source = ~/dotfiles/.profile;
      ".xprofile".source = ~/dotfiles/.xprofile;
      ".Xresources".source = ~/dotfiles/.Xresources;
      ".zshrc".source = ~/dotfiles/.zshrc;
      ".tmux.conf".source = ~/dotfiles/.tmux.conf;
      ".config/bspwm".source = ~/dotfiles/.config/bspwm;
      ".config/polybar".source = ~/dotfiles/.config/polybar;
      ".config/sxhkd".source = ~/dotfiles/.config/sxhkd;
      ".config/picom".source = ~/dotfiles/.config/picom;
      ".config/alacritty".source = ~/dotfiles/.config/alacritty;
      ".config/nvim".source = ~/dotfiles/.config/nvim;
    };
  };

  programs.home-manager.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  home.stateVersion = "24.05";
}
