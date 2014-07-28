printing
printOn: aStream

	aStream nextPutAll: '['.
	(self at: 1) printOn: aStream.
	2 to: self size do: [:i | aStream nextPutAll: ','.  (self at: i) printOn: aStream].
	aStream nextPutAll: ']'