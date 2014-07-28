private
setStdIn
	"Reset to nil if the console has been closed"

	^ self processAccessor getStdIn isNil
		ifTrue: [stdIn := nil]
		ifFalse: [super setStdIn]
