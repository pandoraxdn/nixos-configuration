{ config, pkgs, ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Fix error gtk applications
  programs.dconf.enable = true;

  # Environment system packages
  environment.systemPackages = with pkgs; [
    neovim
    wget
    git
    mariadb
    postgresql
    mpd
    curl
    zsh
    #nginx
    networkmanager
    networkmanagerapplet
    htop
    killall
    unzip
    zip
  ];

  # Fonts
  fonts.fonts = with pkgs; [
    meslo-lg
  ];
}
