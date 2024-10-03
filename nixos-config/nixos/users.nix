{ pkgs, config, ... }:

{
  users.users.xac = {
    shell = pkgs.zsh;
    isNormalUser = true;
    description = "Mohammad";
    extraGroups = [ "input" "disk" "audio" "video" "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };
}
