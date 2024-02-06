{
 description = "Shit";

inputs = {
  nixpkgs.url="nixpkgs/nixos-23.11";
  home-manager={
    url = "github:nix-community/home-manager/release-23.11";
    inputs.nixpkgs.follows = "nixpkgs";
  };
  utils.url = "github:numtide/flake-utils";
  nix-colors.url="github:misterio77/nix-colors";
};

outputs = { self, nixpkgs, home-manager, ... }@inputs:
let
  lib = nixpkgs.lib;
        pkgs = nixpkgs.legacyPackages."x86_64-linux";
  in  {
    nixosConfigurations = {
        Shit = lib.nixosSystem {
          system = "x86_64-linux";
          modules = [ ./configuration.nix ];
        };
    };
    homeConfigurations = {
      ok = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = { inherit inputs; };
        modules = [ ./home.nix ];
      };
    };
  };
}
