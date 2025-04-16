{ config, pkgs, xdnUser, xdnVersion, xdnHost, xdnHome, ... }:

{
  # Enable the X11 windowing system.
  services.xserver.enable = true;

  services.xserver.videoDrivers = ["modesetting"];

  # Disable typing touchpad
  services.libinput.enable = true;
  services.libinput.touchpad.tapping = true; # false
  services.libinput.touchpad.disableWhileTyping = false; # true
  services.libinput.touchpad.clickMethod = "clickfinger";

  # Old versions comment
  #services.xserver.libinput.enable = true;
  #services.xserver.libinput.touchpad.tapping = true; # false
  #services.xserver.libinput.touchpad.disableWhileTyping = false; # true
  #services.xserver.libinput.touchpad.clickMethod = "clickfinger";

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
  #services.xserver.displayManager.sddm.enable = true;
  #services.xserver.desktopManager.plasma5.enable = true;

  # Deepin
  #services.xserver.displayManager.sddm.enable = true;
  #services.xserver.desktopManager.deepin.enable = true;
  #services.deepin.dde-daemon.enable = true;
  #services.deepin.dde-api.enable = true;
  #services.deepin.app-services.enable = true;

  # Budgie
  #services.xserver.desktopManager.budgie.enable = true;
  #services.xserver.desktopManager.budgie.extraPlugins = [ pkgs.budgiePlugins.budgie-analogue-clock-applet ];

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

  # i3
  environment.pathsToLink = [ "/libexec" ];
  services.displayManager.defaultSession = "none+i3";
  services.xserver = {
    desktopManager = {
      xterm.enable = false;
    };
    displayManager = {
      #defaultSession = "none+i3";
      lightdm.enable = true;
      lightdm.greeters.gtk.enable = true;
    };
    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
        dmenu
        i3blocks
        i3lock
        i3status
        kitty
     ];
    };
  };

  /*
  programs.hyprland = {
    enable = true;
    xwayland = {
      enable = true;
      hidpi = false;
    };
    nvidiaPatches = false;
  };
  services.xserver.displayManager.gdm.enable = true;
  */
}
