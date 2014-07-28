initialize-release
setBlocking
	"Set the reader side of the pipe for blocking reads."

	reader ifNotNil: [OSProcess accessor setBlocking: reader ioHandle].
	self blocking: true
