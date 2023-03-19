# configuration.nix
{config, pkgs, ...}: 
let
  flake-compat = builtins.fetchTarball {
    url = "https://github.com/edolstra/flake-compat/archive/master.tar.gz";
    sha256 = "1prd9b1xx8c0sfwnyzkspplh30m613j42l1k789s521f4kv4c2z2";
  };
  hyprland = (import flake-compat {
    src = builtins.fetchTarball {
      url = "https://github.com/hyprwm/Hyprland/archive/master.tar.gz";
      sha256 = "13vs2fq48wnnkvirky5hpfi1xzwajy7zjnswa6677ilbsilzw8w5";
    };
  }).defaultNix;
in {
  imports = [
    hyprland.nixosModules.default
  ];

  programs.hyprland = {
    enable = true;
    package = hyprland.packages.${pkgs.system}.default;
  };

  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
}
