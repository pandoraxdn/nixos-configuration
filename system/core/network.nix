{ config, pkgs, xdnUser, xdnVersion, xdnHost, xdnHome, ... }:

{
  networking.hostName = "${xdnHost}";

  networking.extraHosts =
  ''
        127.0.0.2 pandoraxdn.com
        127.0.0.3 xdn.com
        127.0.0.4 pandorabrs.com
  '';

  # networking.wireless.enable = true; # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [ 80 443 3000 8000 8081 8090 27017 ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = true;
}
