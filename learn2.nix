let 
	pkgs = import <nixpkgs> {};
	x = 1;
	y = 1;
	z = "World";
	set1 = { a = { b = { c = "Hello ${z}"; }; }; };  
	set1.a.c = "C in B";
	set2 = { a.b.c = "Hello ${z}"; };
	recursive = rec { a = "Dika" ; b = a; };
	func = {w ? "world", ...}@args: "Hello ${w} ${pkgs.lib.strings.concatStringsSep "," args.strings}";
	response = builtins.fetchurl "https://jsonplaceholder.typicode.com/todos/1";
in {
 hello = set1.a;
 world = recursive.a;
 hehe = func { strings = [ "lorem" "ipsum" ]; };
 response = builtins.readFile response;
 root = ./.; #pwd or absolute path
}
