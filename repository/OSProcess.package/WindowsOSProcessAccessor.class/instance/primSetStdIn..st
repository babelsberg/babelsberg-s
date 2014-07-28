handles
primSetStdIn: anIOHandle
	"Set the standard input handle to that of anIOHandle, where anIOHandle is a
	ByteArray representation of a SQFile structure."

	<primitive: 'primitiveSetStdIn' module: 'Win32OSProcessPlugin'>

	^ nil