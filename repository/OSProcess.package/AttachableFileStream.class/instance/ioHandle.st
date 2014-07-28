private - IOHandle
ioHandle

	UseIOHandle
		ifTrue: [^ super ioHandle]
		ifFalse: [^ fileID]