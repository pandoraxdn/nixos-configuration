{ config, pkgs, ... }:

{
  # User
  users.users.najimi = {
    isNormalUser = true;
    description = "Rodrigo Xdn";
    initialPassword = "pass";
    group = "users";
    extraGroups = [ "wheel" "disk" "audio" "video" "networkmanager" "systemd-journal" "vboxusers" ];
    shell = pkgs.zsh;
  };
}
