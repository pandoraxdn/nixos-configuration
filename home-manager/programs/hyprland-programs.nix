{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    glpaper
    wf-recorder
    #hyprpicker
    rofi-wayland
    nwg-bar
    grim
    wl-clipboard
    #pcmanfm
    ranger
    sxiv
    wofi
    hyprpaper
    swaybg
    polybar
    pywal
  ];

}
