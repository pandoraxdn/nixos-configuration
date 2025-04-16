{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    dunst
    glpaper
    grim
    hyprpaper
    hyprpicker
    libnotify
    nwg-bar
    pcmanfm
    polybar
    pywal
    ranger
    rofi-wayland
    swaybg
    sxiv
    wf-recorder
    wl-clipboard
    wlrctl
    wofi
  ];

}


