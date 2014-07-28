read, write, position
upToEndOfFile
	"Answer a subcollection from the current access position through
	the last element of the receiver.  Use #atEndOfFile to determine end
	of file status with feof(), required for reliable end of file test on
	OS pipes. Close the file when end of file is detected."

	| b |
	b := super upToEndOfFile.
	self isReadOnly
		ifTrue: [self close].
	^ b