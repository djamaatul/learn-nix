let
	pkgs = import <nixpkgs> {};
	a = {a = { c = 1; d = 3; }; };
	b = {a = { c = 2; }; b = 1;};
	c = a // b; #d = null /error
	d = pkgs.lib.recursiveUpdate a b;
	e = { inherit (a) c d; inherit (b) b; };
in
	e