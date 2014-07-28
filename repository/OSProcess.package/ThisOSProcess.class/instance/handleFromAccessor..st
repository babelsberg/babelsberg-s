private - IOHandle
handleFromAccessor: aByteArrayOrIOAccessor

	UseIOHandle
		ifTrue: [aByteArrayOrIOAccessor isNil
			ifTrue: [^ nil]
			ifFalse: [^ aByteArrayOrIOAccessor asSQFileStruct]]
		ifFalse: [^ aByteArrayOrIOAccessor]
