file control
unixFileNumber: anIOHandle
	"Answer the integer Unix file number corresponding to anIOHandle."

	^ anIOHandle ifNotNil: [self primUnixFileNumber: (self handleFromAccessor: anIOHandle)]
