converting
asBufferedAsyncFileReadStream
	"Answer a replacement for this object, with buffered output."

	^ BufferedAsyncFileReadStream
		name: self name
		attachTo: self ioHandle
		writable: self isReadOnly not
