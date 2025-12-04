{
  description = "My flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }: 
	let
		system = "aarch64-darwin";
		pkgs = nixpkgs.legacyPackages.${system};
		text = pkgs.stdenv.mkDerivation {
      name = "demo";
      buildCommand = '' echo $(date) > $out'';
    }; #into nix/store
		
	in with pkgs; {
    packages.${system} = {
			inherit hello;
			default = pkgs.writeShellScriptBin "hello" ''
			 cat ${text.outPath} | ${pkgs.lolcat}/bin/lolcat
			'';
		};

  };
}
