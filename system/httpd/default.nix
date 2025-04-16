{ config, pkgs, xdnUser, xdnVersion, xdnHost, ... }:

{
  services = {
    httpd = {
      enable = true;
      enablePHP = true;
      virtualHosts = {
        "xdn.com" = {
          documentRoot = "/var/www/xdn.com";
          listen = [{ 
            ip = "*";
            port = 8090;
          }];
          extraConfig = "
            <Directory /var/www/xdn.com>
              Options Indexes FollowSymLinks MultiViews
              AllowOverride All
              Order allow,deny
              allow from all
              Require all granted
            </Directory>
            ";
        };
      };
    };
  };
}
