private - primitive access
primUnixFileNumber: aSQFileStruct
	"Pass a struct SQFile on the stack, and answer the corresponding Unix file number."

	<primitive: 'primitiveUnixFileNumber' module: 'UnixOSProcessPlugin'>
	^ nil
