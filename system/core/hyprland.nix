# configuration.nix
{ config, pkgs, xdnUser, xdnVersion, xdnHost, xdnHome, ... }:
{
  programs.hyprland = {
    enable = true;
    xwayland = {
      enable = true;
      #hidpi = false;
    };
    #enableNvidiaPatches = false;
  };

  environment.sessionVariables = {
    # If your cursor becomes invisible
    #WLR_NO_HARDWARE_CURSORS = "1";
    # Hint electron apps to use wayland
    NIXOS_OZONE_WL = "1";
  };
  
  # XDG portal
  xdg.portal.enable = true;
  #xdg.portal.wlr.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
}
