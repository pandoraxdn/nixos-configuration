{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    filezilla
    onlyoffice-bin
    cider
    helix
    lapce
    go
    python310
    php
    php80Packages.composer
    nodejs-18_x
    opera
    thunderbird
    google-chrome
    vlc
    #netbeans
    #jdk
    beekeeper-studio
    dbeaver
    #youtube-dl
    ffmpeg
    #zoom-us
    flameshot
    jp2a
    lolcat
    ncmpcpp
    sakura
    volumeicon
    dmenu
    udiskie
    leafpad
    unrar
    rnix-lsp
    w3m
    imagemagick
  ];

}
