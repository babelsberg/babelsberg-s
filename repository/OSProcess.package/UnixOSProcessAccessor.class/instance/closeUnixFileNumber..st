file control
closeUnixFileNumber: unixFileDescriptor
	"Close the file associated with unixFileDescriptor, a small integer value."

	<primitive: 'primitiveUnixFileClose' module: 'UnixOSProcessPlugin'>
	^ self primitiveFailed
