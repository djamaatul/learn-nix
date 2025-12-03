let 
	a = 1 + 2;
	b = let c = 0.3; d = 0.7; in c + d;
	func = a: b: a + b;

	func2 = {a,b, ...}: a + b; #... allow another key
	#func2 = x: x.a + x.b; #allow another key

	func3 = a: "Result is ${builtins.toString a}";
	func4 = args@{a, b, ...}: a + b + args.c; #named

	obj = {a = 4; b = 6; c = 0;};
	obj2 = { inherit (obj) a b; c = 1; }; #equivalent a = obj.a, b = obj.b

	str = v1: ''
		The program:
		${v1}
	'';
	result = func3 (func a b  + func2 obj + func4 obj2 ); #comment: (3 + 1) + 10 + 11
in
	str result