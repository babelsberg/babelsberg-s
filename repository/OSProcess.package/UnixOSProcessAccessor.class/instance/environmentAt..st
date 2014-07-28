external process access
environmentAt: aSymbolOrString
	"Get an environment variable from the external OS process."

	"OSProcess thisOSProcess environmentAt: 'PATH'"

	^ self primEnvironmentAtSymbol: aSymbolOrString
