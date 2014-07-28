private - primitive access
primUnixFileClose: integerFileNumber
	"Close a file handle at the close(2) level, using a handle returned by
	#primUnixFileNumber."

	<primitive: 'primitiveUnixFileClose' module: 'UnixOSProcessPlugin'>
	^ nil
