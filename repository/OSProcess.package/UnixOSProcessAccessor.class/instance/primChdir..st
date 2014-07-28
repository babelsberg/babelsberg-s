private - primitive access
primChdir: pathString
	"Change current working directory. Does not update the $PWD environment variable."

	<primitive: 'primitiveChdir' module: 'UnixOSProcessPlugin'>
	^ nil