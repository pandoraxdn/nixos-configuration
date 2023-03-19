{
  description = "NixOS configuration by Rodrigo Xdn";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    #hyprland.url = "github:hyprwm/Hyprland";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }:
    let
      xdnUser = "najimi"; 
      xdnHome = "/home/najimi";
      xdnVersion= "23.05";
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      homeConfigurations.${xdnUser} = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./home-manager/home.nix
          {
            home = {
              username = "${xdnUser}";
              homeDirectory = "${xdnHome}";
              stateVersion = "${xdnVersion}";
            };
          }
        ];
      };
      nixosConfigurations = {
        default = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            ./system/layout/configuration.nix
          ];
        };
        ${xdnUser} = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            ./system/core/configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.${xdnUser} = import ./home-manager/home.nix;
            }
          ];
        };
      };
    };
}
