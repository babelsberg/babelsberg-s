private - IOHandle
handleFromFileStream: aFileStream

	UseIOHandle
		ifTrue: [^ aFileStream ioHandle asSQFileStruct]
		ifFalse: [^ aFileStream fileID]
