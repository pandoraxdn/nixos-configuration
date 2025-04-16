{ config, pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [ nginx ];
  services.nginx.enable = true;
  #systemd.services.nginx.serviceConfig.ProtectHome = "read-only";
  systemd.services.nginx.serviceConfig.ProtectHome = lib.mkForce false;
  systemd.services.nginx.serviceConfig.ProtectSystem = lib.mkForce false;
  #systemd.services.nginx.serviceConfig.ReadWritePaths = [ "/home/najimi/nginx" ];
  imports =
  [
    ./pandoraxdn.com
    #./xdn.com
  ];
}
