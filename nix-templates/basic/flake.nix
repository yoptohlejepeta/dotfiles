{
  description = "My packages";

  inputs = { nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable"; };

  outputs = { nixpkgs, ... }:
    let
      eachSystem = f:
        nixpkgs.lib.genAttrs nixpkgs.lib.systems.flakeExposed
        (system: f nixpkgs.legacyPackages.${system});
    in {
      packages = eachSystem (pkgs:
        {
          # Add your packages here
        });

      devShells =
        eachSystem (pkgs: { default = pkgs.mkShell { buildInputs = [ ]; }; });
    };
}
