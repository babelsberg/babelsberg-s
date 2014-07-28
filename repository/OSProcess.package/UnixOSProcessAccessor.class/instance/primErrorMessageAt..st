external process access
primErrorMessageAt: anInteger
	"Answer an error message string from the sys:=errlist array, indexed by anInteger."

	"OSProcess accessor primErrorMessageAt: 0"
	"OSProcess accessor primErrorMessageAt: 100"
	"OSProcess accessor primErrorMessageAt: 1000"
	"OSProcess accessor primErrorMessageAt: -1"

	<primitive: 'primitiveErrorMessageAt' module: 'UnixOSProcessPlugin'>
	^ nil