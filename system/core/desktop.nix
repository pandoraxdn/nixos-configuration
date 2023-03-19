{ config, pkgs, ... }:

{
  # Enable the X11 windowing system.
  services.xserver.enable = true;

  services.xserver.videoDrivers = ["modesetting"];

  # GNOME Desktop
  #services.xserver.displayManager.gdm.enable = true;
  #services.xserver.desktopManager.gnome.enable = true;

  # PANTHEON Desktop
  #services.xserver.desktopManager.pantheon.enable = true;
  #services.xserver.displayManager.lightdm.greeters.pantheon.enable = true;
  #services.xserver.displayManager.lightdm.enable = true;
  #services.pantheon.apps.enable = true;

  # Xfce Desktop
  #services.xserver.desktopManager.xterm.enable = false;
  #services.xserver.desktopManager.xfce.enable = true;
  #services.xserver.displayManager.defaultSession = "xfce";
  
  # Kde Desktop
  #services.xserver.desktopManager.plasma5.enable = true;

  # Awesome Desktop
  /*
  services.xserver = {
    desktopManager.xterm.enable = false;
    displayManager = {
      defaultSession = "awesome";
    };
    windowManager.awesome = {
      enable = true;
      luaModules = with pkgs.luaPackages; [
        luarocks
        luadbi-mysql
      ];
    };
  };
  */

  # Bspwm
  /*
  services.xserver = {
     autorun = false;
     desktopManager.xterm.enable = false;
     displayManager = {
      defaultSession = "bspwm";
     };
     windowManager.bspwm = {
        enable = true;
  configFile = builtins.getEnv $HOME + "/.config/bspwm/bspwmrc";
  sxhkd.configFile = builtins.getEnv $HOME + "/.config/sxhkd/sxhkdrc";
     }; 
  };
  */

  # I3
  environment.pathsToLink = [ "/libexec" ]; # links /libexec from derivations to /run/current-system/sw
  services.xserver = {
    desktopManager = {
      xterm.enable = false;
    };
    displayManager = {
        defaultSession = "none+i3";
        lightdm.enable = true;
    };
    windowManager.i3 = {
      package = pkgs.i3-gaps;
      enable = true;
      extraPackages = with pkgs; [
        dmenu
        i3status
        i3lock
        i3blocks
	    kitty
     ];
    };
  };
}
