initialize-release
setNonBlocking
	"Set the reader side of the pipe for non-blocking reads."

	reader ifNotNil: [OSProcess accessor setNonBlocking: reader ioHandle].
	self blocking: false
