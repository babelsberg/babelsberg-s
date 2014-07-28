private - primitive access
primGetStdInputForSession: sessionIdentifierByteArray
	"Answer a two element array containing the sqFile data structure representing
	standard input stream for my OS process, and a flag (true or false) to indicate
	whether the sqFile data structure contains a valid HANDLE. If no standard input
	stream is available for this OS process, the sqFile data structure will contain an
	invalid HANDLE value, which will result in failures on subsequent accesses."

	"OSProcess accessor primGetStdInput"

	<primitive: 'primitiveGetStdInput' module: 'Win32OSProcessPlugin'>
	^ nil