updating
update: aParameter
	"Notify any dependents if my run state changes. My subclasses will do additional
	updating when the run state changes."

	aParameter == #runState ifTrue: [self changed: #runState]
