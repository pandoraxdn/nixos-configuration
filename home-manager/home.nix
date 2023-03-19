{ config, pkgs, ... }:

{

  home.username = "najimi";
  home.homeDirectory = "/home/najimi";

  #home-manager.users."najimi".home.file.".config/nixpkgs/config.nix".source = ./nixpkgs-config.nix;

  imports = [ 
    ./programs/cava
    ./programs/element
    ./programs/neofetch
    ./programs/waybar
    ./programs/all-programs.nix
    #./programs/hyprland-programs.nix
    ./programs/i3-programs.nix
    ./home-najimi/.config/hypr
    ./home-najimi/.config/i3
    ./home-najimi/.config/zshrc
    ./home-najimi/.config/ncmpcpp
    ./home-najimi/.config/mpd
    ./home-najimi/.config/nvim
    ./home-najimi/.config/user.dir
  ];

  # Realese home-manager version
  home.stateVersion = "23.05";
  
  # Enable programs of home-manager
  programs.home-manager.enable = true;

}
