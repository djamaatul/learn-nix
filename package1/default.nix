let
  nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-24.05";
  pkgs = import nixpkgs { config = {}; overlays = []; };
in
rec {
  hello = pkgs.callPackage ./hello.nix { };
  echo = pkgs.callPackage ./echo.nix { name = "dika"; };
  echo2 = echo.override { name = "diki"; };
}