{ config, pkgs, ... }:

{
  imports =
    [
    ./../hardware/hardware-configuration.nix
    ./default-settings.nix
    ./desktop.nix
    ./network.nix
    ./packages.nix
    ./services.nix
    ./user.nix
    ];
}
