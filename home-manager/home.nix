{ config, pkgs, ... }:

{

  home.username = "najimi";
  home.homeDirectory = "/home/najimi";

  imports = [ 
    ./programs/element
    ./programs/neofetch
    ./programs/all-programs.nix
    ./home-najimi/.config/zshrc
    ./home-najimi/.config/glava
    ./home-najimi/.config/ncmpcpp
    ./home-najimi/.config/mpd
    ./home-najimi/.config/nvim
    ./home-najimi/.config/user.dir
  ];

  # Realese home-manager version
  home.stateVersion = "22.05";
  
  # Enable programs of home-manager
  programs.home-manager.enable = true;

}
