{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    betterlockscreen
    blueman
    brightnessctl
    conky
    feh
    glava
    lxappearance
    pcmanfm
    picom
    polybar
    pywal
    rofi
    sxiv
    xclip
  ];

}
