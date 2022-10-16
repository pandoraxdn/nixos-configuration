{ config, pkgs, ... }:

{

  nixpkgs.config.allowUnfree = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "najimi";
  home.homeDirectory = "/home/najimi";

  imports = [ 
    ./programs/element
    ./programs/neofetch
    ./home-najimi/.config/zshrc
    ./home-najimi/.config/glava
    ./home-najimi/.config/ncmpcpp
    ./home-najimi/.config/mpd
    ./home-najimi/.config/nvim
    ./home-najimi/.config/user.dir
  ];

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
                go
    		python310
    		php
    		php80Packages.composer
    		nodejs-18_x
    		opera
    		#freeoffice
    		google-chrome
    		vlc
    		sublime3
    		#netbeans
    		#jdk
    		beekeeper-studio
    		dbeaver
    		#youtube-dl
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
            pantheon.elementary-files
  ];

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
