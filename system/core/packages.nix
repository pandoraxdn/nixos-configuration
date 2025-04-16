{ config, pkgs, xdnUser, xdnVersion, xdnHost, xdnHome, ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Fix error gtk applications
  programs.dconf.enable = true;

  nixpkgs.config.permittedInsecurePackages = [
    "electron-12.2.3"
    "electron-19.1.9"
    "openssl-1.1.1u"
    "openssl-1.1.1t"
    "nix-2.15.3"
    "beekeeper-studio-5.1.5"
  ];

  # Environment system packages
  environment.systemPackages = with pkgs; [
    alsa-utils
    blueman
    curl
    git
    htop
    killall
    mariadb
    mpd
    neovim
    networkmanager
    networkmanagerapplet
    nginx
    postgresql
    unzip
    wget
    zip
    zsh
  ];

  # Fonts system
  /*
  fonts.fonts = with pkgs; [
    meslo-lg
  ];
  */
  fonts.packages = with pkgs; [
    #corefonts
    meslo-lg
    #vistafonts
  ];

  # Adb android service
  programs.adb.enable = true;

  services.openssh.enable = true;

}
