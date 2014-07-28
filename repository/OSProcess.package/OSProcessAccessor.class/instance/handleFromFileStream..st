private - IOHandle
handleFromFileStream: aFileStream

	^ UseIOHandle
		ifTrue: [self handleFromAccessor: aFileStream ioHandle]
		ifFalse: [aFileStream fileID]
