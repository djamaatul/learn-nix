let
  nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-24.05";
  pkgs = import nixpkgs { config = {}; overlays = []; };
in

pkgs.mkShellNoCC {
  packages = with pkgs; [
    cowsay
    lolcat
  ];

  TEST_ENV = pkgs.lib.strings.toUpper "Hello";
	world = "World";

  shellHook = ''
    echo "$TEST_ENV $world" | cowsay | lolcat
  '';
}
