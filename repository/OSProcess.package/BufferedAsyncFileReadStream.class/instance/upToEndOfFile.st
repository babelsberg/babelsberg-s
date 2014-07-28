read, write, position
upToEndOfFile
	"Answer a subcollection from the current access position through
	the last element of the receiver.  Use #atEndOfFile to determine end
	of file status with feof(), required for reliable end of file test on
	OS pipes. Close the file when end of file is detected."

	| newStream buffer |
	buffer := buffer1 species new: 1000.
	newStream := WriteStream on: (buffer1 species new: 100).
	[self atEndOfFile] whileFalse:
		[self moveAvailableDataToBuffer.
		newStream nextPutAll: (self nextInto: buffer)].
	self isReadOnly ifTrue: [self close].
	^ newStream contents
