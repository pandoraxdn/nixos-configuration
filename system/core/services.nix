{ config, pkgs, xdnUser, xdnVersion, xdnHost, xdnHome, ... }:

{
  # Enable touchpad support (enabled default in most desktopManager).
  #services.xserver.libinput.enable = true;

  # Configure keymap in X11
  services.xserver = {
    xkb.layout = "es";
    xkb.variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;
  services.printing.drivers = [ pkgs.pkgs.gutenprint ];

  # Enable sound with pipewire.
  
  #sound.enable = true;
  /*
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
  #sound.enable = true;
  #hardware.pulseaudio.enable = true;
  #hardware.pulseaudio.support32Bit = true;

  # mpd
  #hardware.pulseaudio.extraConfig = "load-module module-native-protocol-tcp auth-ip-acl=127.0.0.1 unload-module module-bluetooth-policy";
  #hardware.pulseaudio.extraConfig = "unload-module module-bluetooth-discover";

  # List services that you want to enable:

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # Enable service mariadb-server
  # Since version 22.05 configure mysql_secure_installation
  services.mysql = {
    enable = true;  
    package = pkgs.mariadb;
    initialScript = pkgs.writeText "backend-initScript" ''
      CREATE USER IF NOT EXISTS '${xdnUser}'@'localhost' IDENTIFIED BY 'pass';
      GRANT ALL PRIVILEGES ON * . * TO '${xdnUser}'@'localhost';
      FLUSH PRIVILEGES;
    '';
    /*ensureUsers = [
      {
              name = "${xdnUser}";
              ensurePermissions = {
                "*.*" = "ALL PRIVILEGES";
              };
        }
    ];*/
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
      CREATE ROLE ${xdnUser} WITH LOGIN PASSWORD 'pass' SUPERUSER; 
      CREATE DATABASE ${xdnUser};
      GRANT ALL PRIVILEGES ON DATABASE ${xdnUser} TO ${xdnUser};
    '';
   };

  # Enable service mpd
  services.mpd = {
    enable = true;
    user = "${xdnUser}";
    group = "users";
    musicDirectory = "${xdnHome}/Música";
    dataDir = "${xdnHome}/.config/mpd";
    extraConfig = ''
      audio_output {
        type "pulse"
        name "pulseaudio"
        mixer_type      "hardware"
        mixer_device    "default"
        mixer_control   "PCM"
        mixer_index     "0"
      }
      audio_output {
        type            "pipewire"
        name            "pipewire"
      }
      audio_output {
        type "alsa"
        name "alsa"
        device			"hw:0,0"
        format			"44100:16:2"
        mixer_type		"hardware"
        mixer_device	"default"
        mixer_control	"PCM"
      }
    '';
  };

  # Enable zsh
  programs.zsh.enable = true;

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Adb Android Service
  programs.adb.enable = true;

  services.udev.packages = [
    pkgs.android-udev-rules
  ];

  # Bluetooth Service
  hardware.bluetooth.enable = false;
  hardware.bluetooth.powerOnBoot = false;

  # Flatpak
  services.flatpak.enable = true;
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  xdg.portal.config.common.default = "gtk";

  /*
  services.zoneminder = {
    enable = true;
    webserver = "nginx";
    #storageDir = "/var/www/pandorabrs.com";
    port = 80;
    database = {
      username = "najimi";
      password = "pass";
      name = "zm";
      host = "localhost";
    };
    openFirewall = true;
  };
  */

  # Apache Tomcat
  #services.tomcat.enable = true;
  #services.tomcat.baseDir = "/var/tomcat";

  # MongoDB
  /*
  services.mongodb = {
    package = pkgs.mongodb-5_0;
    #bind_ip = "0.0.0.0";
    initialRootPassword = "pass";
    enable = true;
    extraConfig = ''
      operationProfiling.mode: all
      systemLog.quiet: false
    '';
  };
  */

  # Docker
  virtualisation.docker = {
    enable = true;
    enableOnBoot = true;
    extraOptions = "--iptables=false --log-level=debug";
    #storageDriver = "btrfs";
    rootless = {
      enable = true;
      setSocketVariable = true;
    };
  };

}
