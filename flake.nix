{
  description = "Pandora Xdn NixOs configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    #hyprland.url = "github:hyprwm/Hyprland";
    #nur.url = github:nix-community/NUR;
    #dde-nixos = {
      #url = "github:linuxdeepin/dde-nixos";
      #inputs.nixpkgs.follows = "nixpkgs";
    #};
  };

  outputs = inputs@{ nixpkgs, home-manager, ... }:
  let
  	xdnUser     = "najimi"; 
    xdnHome     = "/home/${xdnUser}";
    xdnVersion  = "25.05";
    xdnHost     = "dead-master";
    system      = "x86_64-linux";
    pkgs        = nixpkgs.legacyPackages.${system};
  in
  {
  	nixosConfigurations = {
      # Flake load by default
      default = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./system/layout/configuration.nix
        ];
      };
      # Flake load by najimi user
      ${xdnUser} = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ({ 
              _module.args = {
                inherit xdnUser xdnHome xdnVersion xdnHost;
              };
          })
          ./system/core/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.${xdnUser} = {
                _module.args = { inherit xdnUser xdnHome xdnVersion xdnHost; };
                imports = [ ./home-manager/home.nix ];
              };
            };
          }
        ];
      };
    };
  };
}
