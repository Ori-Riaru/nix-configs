{
  writeShellScriptBin,
  audiance ? "World",
}:
writeShellScriptBin "hello"
''
  echo "Hello, ${audiance}!"
''
