converting
asAsyncFileReadStream
	"Answer a replacement for this object, with asynchronous event handling but
	no buffering."

	^ AsyncFileReadStream
		name: self name
		attachTo: self ioHandle
		writable: self isReadOnly not
