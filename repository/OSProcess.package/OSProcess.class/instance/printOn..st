printing
printOn: aStream

	super printOn: aStream. aStream nextPutAll: ' with pid '. self pid printOn: aStream