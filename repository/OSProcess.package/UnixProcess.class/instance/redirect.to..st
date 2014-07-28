IO redirection
redirect: aFileStream to: newFileStream

	| oldfd newfd |
	oldfd := self processAccessor unixFileNumber: aFileStream fileID.
	newfd := self processAccessor unixFileNumber: newFileStream fileID.
	self processAccessor primUnixFileClose: oldfd.
	^ self processAccessor primDup: newfd to: oldfd
