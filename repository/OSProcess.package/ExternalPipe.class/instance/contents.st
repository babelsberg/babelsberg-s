accessing
contents
	"Answer contents of the pipe, and return the contents to the pipe so it can still be read."

	"ExternalPipe new nextPutAll: 'hello'; contents"

	| s |
	self closed ifTrue:
		[self notify: self printString, ' ', self reader printString, ' closed'.
		^ nil].
	s := self reader upToEnd.
	s isEmpty ifFalse:
		[self writer closed
			ifTrue: [self notify: self printString, ' ', self writer printString,
								' closed, cannot replace contents']
			ifFalse: [self nextPutAll: s]].
	^ s