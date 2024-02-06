{
  description = "Combined project";

  inputs = {
    shit.url = "path:./Shit.nix";
    cpp.url = "path:./cpp.nix";
  };

  outputs = { self, shit, cpp, ... } @inputs:
    let
      lib = shit.lib;
      nixpkgs = cpp.nixpkgs;
    in {
      nixosConfigurations = {
        Shit = lib.nixosSystem {
          system = "x86_64-linux";
          modules = [ shit.configuration.nix ];
        };
      };
      homeConfigurations = {
        ok = cpp.home-manager.lib.homeManagerConfiguration {
          inherit nixpkgs;
          extraSpecialArgs = { inherit inputs; };
          modules = [ ./home.nix ];
        };
      };
      devShell = cpp.outputs.devShell;
    };
}
