private - primitive access
primEnvironmentAtSymbol: aSymbol
	"Answer the value of an environment variable in the external OS process."

	<primitive: 'primitiveEnvironmentAtSymbol' module: 'UnixOSProcessPlugin'>
	^ nil 