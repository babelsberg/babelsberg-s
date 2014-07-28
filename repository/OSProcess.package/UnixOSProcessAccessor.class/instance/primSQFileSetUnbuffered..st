private - primitive access
primSQFileSetUnbuffered: aSQFileStruct
	"Pass a struct SQFile on the stack, set the file non-blocking."

	<primitive: 'primitiveSQFileSetUnbuffered' module: 'UnixOSProcessPlugin'>
	^ nil
