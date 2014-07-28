finalization
finalize
	"Use this to release any external resources prior to reinitializing."

	super finalize.
	stdIn := stdIn ifNotNil:
		[[stdIn close] on: Error do: [:ex | ].
		nil].
	stdIn := stdOut ifNotNil:
		[[stdOut close] on: Error do: [:ex | ].
		nil].
	stdIn := stdErr ifNotNil:
		[[stdErr close] on: Error do: [:ex | ].
		nil].
	sessionID := nil.
	ppid := nil.
	programName := nil.
	arguments := nil.
	path := nil.
	environment := nil.
	self updateAllMyChildren.
	allMyChildren := nil.
	processAccessor
		ifNotNil: 
			[processAccessor removeDependent: self.
			processAccessor := nil]
