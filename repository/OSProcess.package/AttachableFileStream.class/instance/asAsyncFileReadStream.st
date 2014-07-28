converting
asAsyncFileReadStream
	"Answer a replacement for this object, with asynchronous event handling.
	Do not close the ioHandle when this object is finalized."

	self keepOpen.
	^ AsyncFileReadStream
		name: self name
		attachTo: self ioHandle
		writable: self isReadOnly not
