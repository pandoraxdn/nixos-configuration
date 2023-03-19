{ config, pkgs, ... }:

{
  imports =
    [
    ./../hardware/hardware-configuration.nix
    #./../nginx
    ./default-settings.nix
    ./desktop.nix
    #./hyprland.nix
    ./network.nix
    ./packages.nix
    ./services.nix
    ./user.nix
    ];
}
