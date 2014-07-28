event handling
mouseUp: evt

	super mouseUp: evt.

	dragPoint ifNil: [^ self].
	dragPoint := nil.
	
	self endManipulation
