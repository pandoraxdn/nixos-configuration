{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    xclip
    rofi
    glava
    picom
    polybar
    lxappearance
    pcmanfm
    feh
    sxiv
    betterlockscreen
    conky
    pywal
    brightnessctl
  ];

}
