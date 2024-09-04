{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
      flake-parts = {
        url = "github:hercules-ci/flake-parts";
        inputs.nixpkgs-lib.follows = "nixpkgs";
      };
      mtkclient = {
        url = "github:bkerler/mtkclient";
        flake = false;
      };
  };
    
  outputs =
    inputs@{
      self,
      flake-parts,
      ...
    }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "x86_64-linux"
        "aarch64-linux"
      ];

      perSystem = { self', pkgs, ...}: {
        packages = rec {
          mtkclient = pkgs.callPackage ./mtkclient.nix { src = inputs.mtkclient; };
          default = mtkclient;
        };
      };
    };
}
