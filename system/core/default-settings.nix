{ config, pkgs, xdnUser, xdnVersion, xdnHost, xdnHome, ... }:

{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  nix.settings.trusted-users = [ "root" "${xdnUser}" ];

  # Lasted kernel
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Lasted kernel zen
  #boot.kernelPackages = pkgs.linuxPackages_zen;

  # Bootloader EFI
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelModules = [ "overlay" "aufs" ];
  #boot.kernelParams = [ "systemd.unified_cgroup_hierarchy=0" ];
  #boot.loader.efi.efiSysMountPoint = "/boot/efi";

  # Bootloader LEGACY
  #boot.loader.grub.enable = true;
  #boot.loader.grub.device = "/dev/sda";
  #boot.loader.grub.useOSProber = true;

  # Set your time zone.
  time.timeZone = "America/Mexico_City";

  # Select internationalisation properties.
  i18n.defaultLocale = "es_MX.utf8";

  # Optimise store
  #nix.autoOptimiseStore = true;
  nix.settings.auto-optimise-store = true;

  # Configure console keymap
  #console.keyMap = "es";
  console.keyMap = "la-latin1";

  # State Veersion
  system.stateVersion = "${xdnVersion}";
}
