{writeShellScriptBin, name ? "world"}:
writeShellScriptBin "echo" ''
	echo "Hello ${name}!"
''