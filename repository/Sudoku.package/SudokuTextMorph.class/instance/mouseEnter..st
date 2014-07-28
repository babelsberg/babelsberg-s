event handling
mouseEnter: evt

	super mouseEnter: evt.
	evt hand newKeyboardFocus: self.
	self
		handleInteraction: [editor mouseDown: evt]
		fromEvent: evt.