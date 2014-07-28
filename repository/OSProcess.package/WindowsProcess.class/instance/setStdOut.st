private
setStdOut
	"Reset to nil if the console has been closed"

	^ self processAccessor getStdOut isNil
		ifTrue: [stdOut := nil]
		ifFalse: [super setStdOut]
