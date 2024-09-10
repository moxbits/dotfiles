{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ../pkgs/default.nix
      ../pkgs/fonts.nix
      ./users.nix
    ];

  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

  # Display
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  services.xserver.windowManager.i3.enable = true;

  services.xserver.xkb = {
    layout = "us,ir";
    variant = "";
    options = "grp:win_space_toggle";
  };

  programs.light.enable = true;
  services.picom.enable = true;

  # Networking
  networking.hostName = "m";
  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Tehran";
  i18n.defaultLocale = "en_US.UTF-8";

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Audio
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    #jack.enable = true;
    #media-session.enable = true;
  };

  # Devices and Printers
  services.printing.enable = true;

  services.devmon.enable = true;
  services.gvfs.enable = true;
  services.udisks2.enable = true;

  services.thermald.enable = true;

  # NixOS version
  system.stateVersion = "24.05";
}
