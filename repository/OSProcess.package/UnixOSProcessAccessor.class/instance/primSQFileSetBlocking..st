private - primitive access
primSQFileSetBlocking: aSQFileStruct
	"Pass a struct SQFile on the stack, and call fcntl() to set the file non-blocking."

	<primitive: 'primitiveSQFileSetBlocking' module: 'UnixOSProcessPlugin'>
	^ nil
