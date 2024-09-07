{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [ ];

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
      ".profile".source = ~/dotfiles/.profile;
      ".xprofile".source = ~/dotfiles/.xprofile;
      ".Xresources".source = ~/dotfiles/.Xresources;
      ".zshrc".source = ~/dotfiles/.zshrc;
      ".tmux.conf".source = ~/dotfiles/.tmux.conf;

      ".config/i3".source = ~/dotfiles/.config/i3;
      ".config/i3status".source = ~/dotfiles/.config/i3status;
      ".config/picom".source = ~/dotfiles/.config/picom;

      ".config/alacritty".source = ~/dotfiles/.config/alacritty;
      ".config/nvim".source = ~/dotfiles/.config/nvim;
    };
  };

  programs.home-manager.enable = true;

  programs.zsh.enable = true;
  users.users.xac.shell = pkgs.zsh;

  programs.git.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  home.stateVersion = "24.05";
}
