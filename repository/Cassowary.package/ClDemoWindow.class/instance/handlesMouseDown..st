event handling
handlesMouseDown: evt

	evt redButtonPressed ifTrue: [^ true].
	^ super handlesMouseDown: evt