handles
primSetStdOut: anIOHandle
	"Set the standard output handle to that of anIOHandle, where anIOHandle is a
	ByteArray representation of a SQFile structure."

	<primitive: 'primitiveSetStdOut' module: 'Win32OSProcessPlugin'>

	^ nil