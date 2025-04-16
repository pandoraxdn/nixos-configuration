{ config, lib, pkgs, ... }:

{
  home.packages = [ 
    pkgs.waybar
  ];

  programs.waybar = {
      enable = true;
      style = ''
        * {
          /* `otf-font-awesome` is required to be installed for icons */
          /* font-family: Roboto, Helvetica, Arial, sans-serif; */
          border: none;
          border-radius: 0px;
          font-family: "Meslo LG S Regular";
          font-size: 12px;
          min-height: 0;
        }
        window#waybar {
          background-color: transparent;
          color: #ffffff;
          transition-property: background-color;
          transition-duration: .5s;
        }
        window#waybar.hidden {
          opacity: 0.2;
        }
        #workspaces button {
          color: #ffffff;
        }
        #workspaces button.urgent {
          background-color: #581845;
        }
        #workspaces button:hover {
          background-image: linear-gradient(355deg, rgba(38,16,32,1) 0%, rgba(89,8,46,1) 77%);
          background-color: rgb(38,16,32);
          opacity: 0.5;
          border-radius: 30px;
        }
        /*
        #workspaces button:hover {
          background: lightblue;
          color: black;
          border-bottom: 3px solid #ffffff;
        }
        #workspaces button.active {
          background: #1f1f1f;
        }
        #workspaces button.active:hover {
          background: lightblue;
          color: black;
          border-bottom: 3px solid #ffffff;
        }
        #workspaces button.focused {
          background: #1f1f1f;
        }
        #workspaces button.focused:hover {
          background: lightblue;
          color: black;
          border-bottom: 3px solid #ffffff;
        }
        */
        #mode {
          background-color: #64727D;
          border-bottom: 3px solid #ffffff;
        }
        #clock,
        #battery,
        #cpu,
        #memory,
        #disk,
        #temperature,
        #backlight,
        #network,
        #pulseaudio,
        #custom-media,
        #custom-launcher,
        #custom-power,
        #custom-layout,
        #custom-updater,
        #custom-snip,
        #taskbar,
        #tray,
        #mode,
        #idle_inhibitor,
        #mpd {
          padding: 0 10px;
          color: #ffffff;
        }
        #window,
        #workspaces {
          margin: 0px 4px;
        }
        /* If workspaces is the leftmost module, omit left margin */
        .modules-left > widget:first-child > #workspaces {
          margin-left: 0px;
        }
        /* If workspaces is the rightmost module, omit right margin */
        .modules-right > widget:last-child > #workspaces {
          margin-right: 0px;
        }
        #clock {
          border-radius: 45% 55% 50% 50% / 0% 100% 0% 100% ;
          background-image: linear-gradient(355deg, rgba(38,16,32,1) 0%, rgba(89,8,46,1) 77%); 
          color: black;
          background-color: rgb(36,35,51);
          color: #ffffff;
        }
        #screenshot {
          border-radius: 45% 55% 50% 50% / 0% 100% 0% 100% ;
          background-image: linear-gradient(355deg, rgba(38,16,32,1) 0%, rgba(89,8,46,1) 77%); 
          color: black;
          background-color: rgb(36,35,51);
          color: #ffffff;
        }
        #window{
          border-radius: 30px;
          background-image: linear-gradient(355deg, rgba(38,16,32,1) 0%, rgba(89,8,46,1) 77%);
          color: black;
          background-color: rgb(36,35,51);
          color: #ffffff;
        }
        #battery {
          background-color: #ffffff;
          color: #000000;
        }
        #battery.charging, #battery.plugged {
          color: #ffffff;
          background-color: #26A65B;
        }
        @keyframes blink {
          to {
            background-color: #ffffff;
            color: #000000;
          }
        }
        #battery.critical:not(.charging) {
          background-color: #f53c3c;
          color: #ffffff;
          animation-name: blink;
          animation-duration: 0.5s;
          animation-timing-function: linear;
          animation-iteration-count: infinite;
          animation-direction: alternate;
        }
        label:focus {
          background-color: #000000;
        }
        #cpu {
          border-radius: 45% 55% 50% 50% / 0% 100% 0% 100% ;
          background-image: linear-gradient(355deg, rgba(38,16,32,1) 0%, rgba(89,8,46,1) 77%);
          background-color: rgb(38,16,32);
          color: #ffffff;
        }
        #memory {
          border-radius: 45% 55% 50% 50% / 0% 100% 0% 100% ;
          background-image: linear-gradient(355deg, rgba(38,16,32,1) 0%, rgba(89,8,46,1) 77%);
          background-color: rgb(38,16,32);
          color: #ffffff;
        }
        #disk {
          border-radius: 45% 55% 50% 50% / 0% 100% 0% 100% ;
          background-image: linear-gradient(355deg, rgba(38,16,32,1) 0%, rgba(89,8,46,1) 77%);
          background-color: rgb(38,16,32);
          color: #ffffff;
        }
        #backlight {
          background-color: #90b1b1;
        }
        #network {
          border-radius: 45% 55% 50% 50% / 0% 100% 0% 100% ;
          background-image: linear-gradient(355deg, rgba(38,16,32,1) 0%, rgba(89,8,46,1) 77%);
          background-color: rgb(38,16,32);
          color: #ffffff;
        }
        #network.disconnected {
          border-radius: 45% 55% 50% 50% / 0% 100% 0% 100% ;
          background-image: linear-gradient(355deg, rgba(38,16,32,1) 0%, rgba(89,8,46,1) 77%);
          background-color: rgb(38,16,32);
          color: red;
        }
        #pulseaudio {
          border-radius: 45% 55% 50% 50% / 0% 100% 0% 100% ;
          background-image: linear-gradient(355deg, rgba(38,16,32,1) 0%, rgba(89,8,46,1) 77%);
          background-color: rgb(38,16,32);
          color: #ffffff;
        }
        #pulseaudio.muted {
          border-radius: 45% 55% 50% 50% / 0% 100% 0% 100% ;
          background-image: linear-gradient(355deg, rgba(38,16,32,1) 0%, rgba(89,8,46,1) 77%);
          background-color: rgb(38,16,32);
          color: red;
        }
        #custom-media {
          background-color: #8EC5FC;
          border-radius: 45% 55% 50% 50% / 0% 100% 0% 100% ;
          background-image: linear-gradient(355deg, rgba(38,16,32,1) 0%, rgba(89,8,46,1) 77%);
          color: black;
          margin-right: 5px;
          margin-left: 5px;
        }
        #custom-media.custom-spotify {
          background-color: #8EC5FC;
          background-image: linear-gradient(62deg, #8EC5FC 0%, #E0C3FC 100%);
          color: black;
          border-radius: 20px;
          margin-right: 5px;
        }
        #custom-media.custom-vlc {
          background-color: #8EC5FC;
          background-image: linear-gradient(62deg, #8EC5FC 0%, #E0C3FC 100%);
          color: black;
          border-radius: 20px;
          margin-right: 5px;
        }
        #workspaces{
          border-radius: 30px;
          background-image: linear-gradient(355deg, rgba(38,16,32,1) 0%, rgba(89,8,46,1) 77%);
          background-color: rgb(38,16,32);
          font-size: 20px;
          margin-left: 5px;
        }
        #custom-power{
          border-radius: 45% 55% 50% 50% / 0% 100% 0% 100% ;
          background-image: linear-gradient(355deg, rgba(38,16,32,1) 0%, rgba(89,8,46,1) 77%);
          background-color: rgb(38,16,32);
          font-size: 18px;
          margin-right: 5px;
        }
        #custom-launcher{
          border-radius: 45% 55% 50% 50% / 0% 100% 0% 100% ;
          background-image: linear-gradient(355deg, rgba(38,16,32,1) 0%, rgba(89,8,46,1) 77%);
          background-color: rgb(38,16,32);
          font-size: 20px;
          margin-left: 5px;
        }
        #disk{
          border-radius: 45% 55% 50% 50% / 0% 100% 0% 100% ;
          background-image: linear-gradient(355deg, rgba(38,16,32,1) 0%, rgba(89,8,46,1) 77%);
          background-color: rgb(38,16,32);
          font-size: 20px;
          margin-left: 5px;
        }
        #submap{
          border-radius: 45% 55% 50% 50% / 0% 100% 0% 100% ;
          background-image: linear-gradient(355deg, rgba(38,16,32,1) 0%, rgba(89,8,46,1) 77%);
          background-color: rgb(38,16,32);
          font-size: 20px;
          margin-left: 5px;
        }
        #custom-layout{
          border-radius: 45% 55% 50% 50% / 0% 100% 0% 100% ;
          background-image: linear-gradient(355deg, rgba(38,16,32,1) 0%, rgba(89,8,46,1) 77%);
          background-color: rgb(38,16,32);
          color: white;
          font-size:20px;
        }
        #custom-updater {
          border-radius: 45% 55% 50% 50% / 0% 100% 0% 100% ;
          background-image: linear-gradient(355deg, rgba(38,16,32,1) 0%, rgba(89,8,46,1) 77%);
          background-color: rgb(38,16,32);
          color: white;
        }
        #custom-snip {
          border-radius: 45% 55% 50% 50% / 0% 100% 0% 100% ;
          background-image: linear-gradient(355deg, rgba(38,16,32,1) 0%, rgba(89,8,46,1) 77%);
          background-color: rgb(38,16,32);
          color: skyblue;
          font-size: 20px;
        }
        #taskbar{
          border-radius: 45% 55% 50% 50% / 0% 100% 0% 100% ;
          background-image: linear-gradient(355deg, rgba(38,16,32,1) 0%, rgba(89,8,46,1) 77%);
          background-color: rgb(38,16,32);
        }
        #temperature {
          border-radius: 45% 55% 50% 50% / 0% 100% 0% 100% ;
          background-image: linear-gradient(355deg, rgba(38,16,32,1) 0%, rgba(89,8,46,1) 77%);
          background-color: rgb(38,16,32);
          color: #ffffff;
        }
        #temperature.critical {
          border-radius: 45% 55% 50% 50% / 0% 100% 0% 100% ;
          background-image: linear-gradient(355deg, rgba(38,16,32,1) 0%, rgba(89,8,46,1) 77%);
          background-color: #eb4d4b;
        }
        #tray {
          border-radius: 45% 55% 50% 50% / 0% 100% 0% 100% ;
          background-image: linear-gradient(355deg, rgba(38,16,32,1) 0%, rgba(89,8,46,1) 77%);
          background-color: rgb(38,16,32);
          color: #ffffff;
        }
        #tray > .passive {
          -gtk-icon-effect: dim;
          background-color: rgb(38,16,32);
          color: #ffffff;
        }
        #tray > .needs-attention {
          -gtk-icon-effect: highlight;
          background-color: rgb(38,16,32);
          color: #ffffff;
        }
        #idle_inhibitor {
          border-radius: 45% 55% 50% 50% / 0% 100% 0% 100% ;
          background-image: linear-gradient(355deg, rgba(38,16,32,1) 0%, rgba(89,8,46,1) 77%);
          background-color: rgb(38,16,32);
        }
        #idle_inhibitor.activated {
          border-radius: 45% 55% 50% 50% / 0% 100% 0% 100% ;
          background-image: linear-gradient(355deg, rgba(38,16,32,1) 0%, rgba(89,8,46,1) 77%);
          background-color: rgb(38,16,32);
          color: #ffffff;
        }
        #language {
          background-color: rgb(38,16,32);
          color: #ffffff;
          min-width: 16px;
        }
        #keyboard-state {
          background: #97e1ad;
          color: #000000;
          min-width: 16px;
        }
        #keyboard-state > label {
          padding: 0px 5px;
        }
        #keyboard-state > label.locked {
          background: rgba(0, 0, 0, 0.2);
        }
      '';
      settings = [
        {
          "layer" = "top";
          "position" = "top";
          "gtk-layer-shell" = true;
          "modules-center" = [
            "hyprland/workspaces"
          ];
          "modules-left" = [
            "custom/launcher"
            "hyprland/window"
            "hyprland/submap"
          ];
          "modules-right" = [
            "screenshot"
            "clock"
            "temperature"
            "custom/power"
          ];
          "hyprland/workspaces" = {
            "format" = "{icon} : {id}";
            "format-icons" = {
              "1" = "I";
              "2" = "II";
              "3" = "III";
              "4" = "IV";
              "5" = "V";
              "6" = "VI";
              "7" = "VII";
              "8" = "VIII";
              "9" = "IX";
              "10" = "X";
              "urgent" = "";
              "active" = "";
              "default" = "";
            };
          };
          "clock" = {
            "align" = 0;
            "format" = "{:%d %b <span rise='1000'>⁙</span> %I:%M %p}";
            "format-alt" = "{:%A <span rise='1000'>⁙</span> %d %B %Y <span rise='1000'>⁙</span> %I:%M %p}";
            "interval" = 60;
            "rotate" = 0;
            "tooltip-format" = "<big>{:%B %Y}</big>\n<tt><small>{calendar}</small></tt>";
          };
          "custom/launcher" = {
            "format" = "<span font='13' rise='1000'> </span>";
            "on-click" = "bash ~/.config/hypr/wofi/launcher/launcher.sh";
            "tooltip" = false;
          };
          "screenshot" = {
            "format" = "<span font='13' rise='1000'> </span>";
            "on-click" = "bash grim $HOME/$(date +'%_captura.png')";
            "tooltip" = false;
          };
          "custom/power" = {
            "format" = "<span font='13' rise='1000'>⏻</span>";
            "on-click" = "nwg-bar";
            "on-click-right" = "killall nwg-bar";
          };
          "hyprland/submap" = {
            "format" = "<span font='10'> {}</span>";
            "max-length" = 10;
            "tooltip" = false;
          };
          "hyprland/window" = {
            "format" = "<span font='10' rise='1000'>⁙</span> {} <span rise='1000'>⁙</span>";
            "separate-outputs" = true;
            "max-length" = 40;
          };
          "temperature" = {
            "critical-threshold" = 80;
            "format" = "{temperatureC}°C {icon}";
            "format-icons" = [
              ""
              ""
              ""
            ];
          };
        }
        {
          "layer" = "bottom";
          "position" = "bottom";
          "gtk-layer-shell" = true;
          "modules-center" = [
            "network"
          ];
          "modules-left" = [
            "cpu"
            "memory"
            "disk"
          ];
          "modules-right" = [
            "pulseaudio"
            "tray"
          ];
          "cpu" = {
            "format" = "<span font='11' rise='500'></span> <span font='11'>{usage}%</span>";
            "format-alt" = "<span font='10' rise='4000'>{icon0}{icon1}{icon2}{icon3}</span> <span font='13'rise='1000'>{usage:>2}%</span>";
            "format-icons" = [
              "▁"
              "▂"
              "▃"
              "▄"
              "▅"
              "▆"
              "▇"
              "█"
            ];
            "interval" = 2;
          };
          "disk" = {
            "format" = "<span font='10'> {used}/{percentage_used}%</span>";
            "format-alt" = "<span font='10'> {free}/{percentage_free}%</span>";
            "interval" = 30;
            "path" = "/";
            "tooltip" = false;
          };
          "memory" = {
            "format" = "{used:0.1f}G/{total:0.1f}GB ";
          };
          "network" = {
            "format-alt" = "<span font='11' rise='1000'></span> {bandwidthUpBits} | <span font='13' rise='1000'></span> {bandwidthDownBits}";
            "format-disabled" = "<span font='11' rise='1000'>睊</span> Disabled";
            "format-disconnected" = "<span font='11' rise='1000'>睊</span> Disconnected";
            "format-ethernet" = "<span font='11' rise='1000'></span> {ipaddr}/{cidr}";
            "format-linked" = "<span font='11' rise='1000'></span> {ifname} (No IP)";
            "format-wifi" = "<span font='10' rise='2000'></span> {signalStrength}%";
            "interval" = 5;
            "tooltip-format" = "<span font='11' rise='1000'></span> {ifname} {essid} via {gwaddr}";
          };
          "pulseaudio" = {
            "format" = "{volume}% {icon}";
            "format-bluetooth" = "{volume}% {icon}";
            "format-bluetooth-muted" = "{icon} {format_source}";
            "format-icons" ={
              "car" = "";
              "default" = [
                ""
                ""
                ""
              ];
              "hands-free" = "";
              "headphone" = "";
              "headset" = "";
              "phone" = "";
              "portable" = "";
            };
            "format-muted" = "{format_source}";
            "format-source" = "";
            "format-source-muted" = "";
          };
          "tray" = {
            "icon-size" = 20;
            "spacing" = 10;
          };
        }
      ];
    };
}
