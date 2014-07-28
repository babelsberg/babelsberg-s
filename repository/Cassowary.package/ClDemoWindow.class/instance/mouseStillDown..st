event handling
mouseStillDown: evt

	super mouseStillDown: evt.

	dragPoint ifNil: [^ self].
	self manipulationMoveTo: (evt cursorPoint - self position)