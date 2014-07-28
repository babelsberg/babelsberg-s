attaching
name: aSymbolOrString attachTo: anIOHandle writable: readWriteFlag
	"Attach to an existing file handle, assumed to have been previously opened by the underlying operating system."

	name := aSymbolOrString.
	UseIOHandle
		ifTrue: [self ioHandle: anIOHandle]
		ifFalse: [fileID := anIOHandle].
	readWriteFlag ifTrue: [self readWrite] ifFalse: [self readOnly].
	self ascii.
	UseIOHandle ifFalse: [self register]
