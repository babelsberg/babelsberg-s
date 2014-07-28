converting
asAttachableFileStream
	"Answer a replacement for this object, with no asynchronous event handling.
	Do not close the ioHandle when this object is finalized."

	self keepOpen.
	^ AttachableFileStream
		name: self name
		attachTo: self ioHandle
		writable: self isReadOnly not
