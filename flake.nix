{
  description = "st flake by jonwin";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, utils }:
    utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs {
        inherit system;

        overlays = [
          (final: prev: {
            st = prev.st.overrideAttrs (old: {
              src = ./.;
              buildInputs = with prev; old.buildInputs ++ [harfbuzz];
            });
          })
        ];
      };
    in {
      packages.default = pkgs.st;

      devShell = pkgs.mkShell {
        buildInputs = with pkgs; [
          gnumake
          xorg.libX11
          xorg.libXft
          xorg.libXinerama
          harfbuzz
        ];
      };
    });
}
