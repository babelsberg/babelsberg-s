event handling
handlesMouseStillDown: evt

	evt redButtonPressed ifTrue: [^ true].
	^ super handlesMouseStillDown: evt