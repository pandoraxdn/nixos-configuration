{ config, pkgs, ... }:

{

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    dmenu
    feh
    glava
    pywal
    rofi
    volumeicon
    xclip
  ];

}
