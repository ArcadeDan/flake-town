{ # flake.nix
  description = "NixOS configuration";
 
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-22.11";
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/release-22.11";
  };
 
  outputs = {
    self
    , nixpkgs
    , nixpkgs-unstable
    , home-manager
  }:
    let
      system = "x86_64-linux";
    in {
      nixosConfigurations = {
        nixos = nixpkgs.lib.nixosSystem {
          inherit system;
 
          specialArgs = {
            inherit
              self
              nixpkgs
              nixpkgs-unstable;
            };
 
          modules = [
            ./configuration.nix
            ./overlays.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.dan = import ./home.nix;
 
              # Optionally, use home-manager.extraSpecialArgs to pass
              # arguments to home.nix
            }
          ];
        };
      };
    };
}