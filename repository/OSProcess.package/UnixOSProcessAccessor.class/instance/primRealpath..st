private - primitive access
primRealpath: pathString
	"Resolve pathString into a real path if possible, or answer nil."

	<primitive: 'primitiveRealpath' module: 'UnixOSProcessPlugin'>
	^ nil