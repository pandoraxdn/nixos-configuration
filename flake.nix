{
  description = "NixOS configuration by Rodrigo Xdn";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ nixpkgs, home-manager, ... }: {
    nixosConfigurations = {
      default = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./system/layout/configuration.nix
        ];
      };
      najimi = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./system/core/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.najimi = import ./home-manager/home.nix;
          }
        ];
      };
    };
  };
}
