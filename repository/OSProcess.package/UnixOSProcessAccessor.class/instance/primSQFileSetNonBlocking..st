private - primitive access
primSQFileSetNonBlocking: aSQFileStruct
	"Pass a struct SQFile on the stack, and call fcntl() to set the file non-blocking."

	<primitive: 'primitiveSQFileSetNonBlocking' module: 'UnixOSProcessPlugin'>
	^ nil
