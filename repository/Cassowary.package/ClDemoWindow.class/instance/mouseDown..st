event handling
mouseDown: evt

	super mouseDown: evt.

	grabPoint ifNil: [^ self].
	dragPoint := grabPoint.
	grabPoint := nil.
	
	self beginManipulation
