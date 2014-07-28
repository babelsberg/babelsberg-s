accessing
upToEndOfFile
	"Answer the remaining elements in the pipe.  Use #isAtEndOfFile: to
	determine end of file status with feof(), required for reliable end of
	file test on OS pipes."

	reader closed
		ifTrue: [^ '']
		ifFalse: [^ reader upToEndOfFile]