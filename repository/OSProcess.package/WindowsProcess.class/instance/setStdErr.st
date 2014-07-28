private
setStdErr
	"Reset to nil if the console has been closed"

	^ self processAccessor getStdErr isNil
		ifTrue: [stdErr := nil]
		ifFalse: [super setStdErr]
