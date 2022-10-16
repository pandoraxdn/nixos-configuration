{ config, pkgs, ... }:

{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";

  # Set your time zone.
  time.timeZone = "America/Mexico_City";

  # Select internationalisation properties.
  i18n.defaultLocale = "es_MX.utf8";

  # Optimise store
  #nix.autoOptimiseStore = true;
  nix.settings.auto-optimise-store = true;

  # Configure console keymap
  console.keyMap = "es";

  # State Veersion
  system.stateVersion = "22.05";
}
