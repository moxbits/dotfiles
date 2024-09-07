{ pkgs, config, ... }:

{
  users.users.xac = {
    isNormalUser = true;
    description = "Mohammad";
    extraGroups = [ "input" "disk" "audio" "video" "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };
}
