initialize-release
setBufferedReader
	"Use an event driven AsyncFileReadStream to represent the reader end of the pipe.
	This should be used if the pipe will be read by a Smalltalk process. It should not
	be used if the pipe is to be read by an external OS process."

	reader ifNotNil:
		[reader removeDependent: self.
		reader unregister.
		self reader: reader asBufferedAsyncFileReadStream.
		self setNonBlocking.
		reader addDependent: self.
		^ true].
	^ false
