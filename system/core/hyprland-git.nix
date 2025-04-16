# configuration.nix
{ config, pkgs, xdnUser, xdnVersion, xdnHost, xdnHome, ... }:

let
  flake-compat = builtins.fetchTarball {
    url = "https://github.com/edolstra/flake-compat/archive/master.tar.gz";
    sha256 = "1prd9b1xx8c0sfwnyzkspplh30m613j42l1k789s521f4kv4c2z2";
  };
  hyprland = (import flake-compat {
    src = builtins.fetchTarball {
      url = "https://github.com/hyprwm/Hyprland/archive/master.tar.gz";
      sha256 = "1swx382v6prx49iw82km5nw4i4qqpimfka7kzv3wp3vh9li6wq98";
    };
  }).defaultNix;
in {
  imports = [
    hyprland.nixosModules.default
  ];

  programs.hyprland = {
    enable = true;
    package = hyprland.packages.${pkgs.system}.default;
    xwayland = {
      enable = true;
      hidpi = false;
    };
    nvidiaPatches = false;
  };

  environment.sessionVariables = {
    # If your cursor becomes invisible
    #WLR_NO_HARDWARE_CURSORS = "1";
    # Hint electron apps to use wayland
    NIXOS_OZONE_WL = "1";
  };
  
  # XDG portal
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
}
