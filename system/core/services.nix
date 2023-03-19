{ config, pkgs, ... }:

{
  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Configure keymap in X11
  services.xserver = {
    layout = "es";
    xkbVariant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;
  services.printing.drivers = [ pkgs.pkgs.gutenprint ];

  # Enable sound with pipewire.
  /*
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };
  */

  # Pulse audio
  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;
  hardware.pulseaudio.support32Bit = true;

  # mpd
  hardware.pulseaudio.extraConfig = "load-module module-native-protocol-tcp auth-ip-acl=127.0.0.1 unload-module module-bluetooth-policy";
  #hardware.pulseaudio.extraConfig = "unload-module module-bluetooth-discover";

  # List services that you want to enable:

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # Enable service mariadb-server
  # Since version 22.05 configure mysql_secure_installation
  services.mysql = {
    enable = true;  
    package = pkgs.mariadb;
    ensureUsers = [
      {
              name = "najimi";
              ensurePermissions = {
                "*.*" = "ALL PRIVILEGES";
              };
        }
    ];
  };

  # Enable service postgresql
  services.postgresql = {
    enable = true;
    package = pkgs.postgresql;
    enableTCPIP = true;
    authentication = pkgs.lib.mkOverride 10 ''
      local all all trust
      host all all ::1/128 trust
      host  all  all 0.0.0.0/0 md5
    '';
    initialScript = pkgs.writeText "backend-initScript" ''
      CREATE ROLE najimi WITH LOGIN PASSWORD 'pass' SUPERUSER; 
      CREATE DATABASE najimi;
      GRANT ALL PRIVILEGES ON DATABASE najimi TO najimi;
    '';
   };

  # Enable service mpd
  services.mpd = {
    enable = true;
    user = "najimi";
    group = "users";
    musicDirectory = "/home/najimi/Música";
    dataDir = "/home/najimi/.config/mpd";
    extraConfig = ''
      audio_output {
        type "pulse"
        name "Pulseaudio"
        server "127.0.0.1"
      }
    '';
  };

  # Enable zsh
  programs.zsh.enable = true;

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;
}
