#!/usr/bin/env bash

# Dir to copy fonts
FDIR="$HOME/.local/share/fonts"

# Source of files fonts
#DIR="$HOME/.config/i3/setup"
DIR="$HOME/Flake/home-manager/home-najimi/.config/i3/source/setup"

# Install Fonts                                                                                                                                          │⣄         
install_fonts()
{
    if [[ -d "$FDIR" ]]; then 
        cp -rf $DIR/fonts/* "$FDIR"
    else
        mkdir -p "$FDIR"
        cp -rf "$DIR"/fonts/* "$FDIR"
    fi
}

install_pkgs()
{

    clear

	cat <<- EOF
        [*] Instalando dotfiles (I3WM)...
		
		[*] Seleccioné la distribución en uso.
		[1] Fedora
		[2] Arch
		[3] NixOs
		[4] Ubuntu-Debian
		[5] Instalar fonts polybar
	
	EOF

	read -p "[?] Seleccioné una opción : "


	if [[ $REPLY == "1" ]]
	then
	    sudo dnf remove i3
        sudo dnf install i3-gaps i3status i3lock i3blocks picom polybar udiskie flameshot nm-applet volumeicon sakura feh pcmanfm dmenu rofi sxiv
	elif [[ $REPLY == "2" ]]
	then
	    sudo pacman -R i3
        yay -S i3-gaps i3status i3lock i3blocks picom polybar udiskie flameshot network-manager-applet volumeicon sakura feh pcmanfm dmenu rofi brightnessctl sxiv
	elif [[ $REPLY == "3" ]]
    then
        echo "
            environment.pathsToLink = [ "/libexec" ];
            services.xserver = {
                enable = true;
                desktopManager = {
                        xterm.enable = false;
                    };
                displayManager = {
                        defaultSession = "none+i3";
                };
                windowManager.i3 = {
                    package = pkgs.i3-gaps;
                    enable = true;
                    extraPackages = with pkgs; [
                            xss-lock
                            i3status
                            i3lock
                            i3blocks
                            picom
                            rofi
                            sakura
                            volumeicon
                            polybar
                            networkmanager
                            networkmanagerapplet
                            brightnessctl
                            lxappearance
                            dmenu
                            udiskie
                            htop
                            killall
                            leafpad
                            neofetch
                            unzip
                            zip
                            pcmanfm
                            feh
                            unrar
                            sxiv
                        ];
                };
              };
        " > $HOME/i3-desktop.nix
        echo "Archivo creado en $HOME/i3-desktop.nix"
	elif [[ $REPLY == "4" ]]
	then
        sudo apt install i3-gaps i3status i3lock i3blocks picom polybar udiskie flameshot network-manager-applet volumeicon sakura feh pcmanfm dmenu rofi brightnessctl sxiv
	elif [[ $REPLY == "5" ]]
	then
        install_fonts    
	else
		echo -e "\n[!] Opción invalida, saliendo...\n"
		exit 1
	fi

}

install_pkgs
