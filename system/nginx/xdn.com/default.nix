{ config, pkgs, ... }:

{
  services.nginx.virtualHosts."xdn.com" = {
    default = true;
    root = "/home/najimi/nginx";
    locations."~ \.php$".extraConfig = ''
      fastcgi_pass  unix:${config.services.phpfpm.pools.mypool.socket};
      fastcgi_index index.php;
    '';
  };

  services.phpfpm.pools.mypool = {                                                                                                                                                                                                             
    user = "nobody";                                                                                                                                                                                                                           
    settings = {                                                                                                                                                                                                                               
      pm = "dynamic";            
      "listen.owner" = config.services.nginx.user;                                                                                                                                                                                                              
      "pm.max_children" = 5;                                                                                                                                                                                                                   
      "pm.start_servers" = 2;                                                                                                                                                                                                                  
      "pm.min_spare_servers" = 1;                                                                                                                                                                                                              
      "pm.max_spare_servers" = 3;                                                                                                                                                                                                              
      "pm.max_requests" = 500;                                                                                                                                                                                                                 
    }; 
  };
}
