private - primitive access
primGetStdErrorForSession: sessionIdentifierByteArray
	"Answer a two element array containing the sqFile data structure representing
	standard error stream for my OS process, and a flag (true or false) to indicate
	whether the sqFile data structure contains a valid HANDLE. If no standard error
	stream is available for this OS process, the sqFile data structure will contain an
	invalid HANDLE value, which will result in failures on subsequent accesses."

	"OSProcess accessor primGetStdError"

	<primitive: 'primitiveGetStdError' module: 'Win32OSProcessPlugin'>
	^ nil