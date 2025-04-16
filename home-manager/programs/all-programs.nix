{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    #amberol
    #etcher
    #google-chrome-dev
    #jdk
    #microsoft-edge
    #netbeans
    #thunderbird
    #youtube-dl
    #zoom-us
    arandr
    beekeeper-studio
    #cider
    #code-minimap
    conky
    devenv
    dbeaver-bin
    #discord
    dmenu
    docker-compose
    exfat
    ffmpeg
    firefox-unwrapped
    filezilla
    flameshot
    focuswriter
    glava
    go
    google-chrome
    guake
    helix
    imagemagick
    insomnia
    jp2a
    krita
    lapce
    libreoffice
    lolcat
    #mongodb-compass
    #netbeans
    ncmpcpp
    nodejs_22
    notable
    oneko
    opera
    php83
    php83Packages.composer
    python3
    pywal
    #rnix-lsp
    sakura
    scrcpy
    scrot
    simple-mtpfs
    simplescreenrecorder
    tilix
    udiskie
    unrar
    #vivaldi
    vlc
    volumeicon
    w3m
    wine
    #wpsoffice
    xfce.mousepad # -> leafpad
    xorg.xrandr
  ];

}
