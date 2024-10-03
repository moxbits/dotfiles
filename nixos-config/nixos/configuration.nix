{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ../pkgs/default.nix
      ../pkgs/fonts.nix
      ./users.nix
    ];


  boot.loader.timeout = 0;
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.initrd.kernelModules = [ "amdgpu" ];

  # Display
  services.xserver.enable = true;
  services.xserver.videoDrivers = [ "amdgpu" ];
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  services.xserver.windowManager.bspwm.enable = true;

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

  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

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


  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # NixOS version
  system.stateVersion = "24.05";
}
