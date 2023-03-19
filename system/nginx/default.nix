{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ nginx ];
  services.nginx.enable = true;
  systemd.services.nginx.serviceConfig.ProtectHome = "read-only";
  services.nginx.user = "/home/najimi/public_html/virtualhost/pandoraxdn.com";
  /*
  imports =
  [
    ./pandoraxdn.com
    ];
    */
}
