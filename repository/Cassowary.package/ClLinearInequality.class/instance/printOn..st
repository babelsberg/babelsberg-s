printing
printOn: aStream

	self strength printOn: aStream.
	aStream nextPutAll: '('.
	expression printOn: aStream.
	aStream nextPutAll: '>=0)'