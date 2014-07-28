printing
printOn: aStream.

	self strength printOn: aStream.
	aStream nextPut: $(.
	expression printOn: aStream.
	aStream nextPutAll: '=0)'