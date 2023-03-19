{ config, pkgs, ... }:

{
  services.nginx.virtualHosts."pandoraxdn.com" = {
      root = "/var/www/virtualhost/pandoraxdn.com";
  };
}
