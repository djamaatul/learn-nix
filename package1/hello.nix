#packages

{stdenv}:
stdenv.mkDerivation {
	name = "hello";
	version = "0.1.0";

	src = ./.;

	buildPhase = ''
		$CC simple.c -o hello_nix
	'';

	installPhase = ''
		mkdir -p $out/bin
		cp hello_nix  $out/bin/hello_nix
	'';
}