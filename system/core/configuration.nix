{ config, pkgs, xdnUser, xdnVersion, xdnHost, xdnHome, ... }:

{
  imports =
    [
    ./../hardware/hardware-configuration.nix
    #./../nginx
    #./../overlays/neofetch.nix
    #./../httpd
    ./default-settings.nix
    ./desktop.nix
    #./hyprland-git.nix
    #./hyprland.nix
    ./network.nix
    ./packages.nix
    ./services.nix
    ./user.nix
    ];
}
