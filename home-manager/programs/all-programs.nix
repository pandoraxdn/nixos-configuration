{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
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
    cava
    code-minimap
    glava
    lolcat
    ncmpcpp
    picom
    rofi
    sakura
    volumeicon
    polybar
    brightnessctl
    lxappearance
    dmenu
    udiskie
    leafpad
    pcmanfm
    feh
    unrar
    sxiv
    betterlockscreen
    conky
    pywal
    rnix-lsp
    w3m
    imagemagick
  ];

}
