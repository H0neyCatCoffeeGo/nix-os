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
  xremap-flake.url="github:xremap/nix-flake";
  spicetify-nix.url = "github:the-argus/spicetify-nix";
};

outputs = { self, nixpkgs, home-manager, spicetify-nix, ... }@inputs:
let
  lib = nixpkgs.lib;
        pkgs = nixpkgs.legacyPackages."x86_64-linux";
  in  {
    nixosConfigurations = {
        Shit = lib.nixosSystem {
          specialArgs = { inherit inputs; };
          system = "x86_64-linux";
          modules = [ ./configuration.nix ];
        };
    };
    homeConfigurations = {
      ok = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = { inherit inputs spicetify-nix;
                           };
        modules = [ ./home.nix
                     ./features/spotify.nix
                  ];
      };
    };
  };
}
