private - primitive access
primSQFileFlush: aSQFileStruct
	"Pass a struct SQFile on the stack, flush the external file stream."

	<primitive: 'primitiveSQFileFlush' module: 'UnixOSProcessPlugin'>
	^ nil
