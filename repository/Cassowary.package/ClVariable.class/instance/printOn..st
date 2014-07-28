printing
printOn: aStream

	super printOn: aStream.
	aStream nextPutAll: '['.  self value printOn: aStream.  aStream nextPutAll: ']'