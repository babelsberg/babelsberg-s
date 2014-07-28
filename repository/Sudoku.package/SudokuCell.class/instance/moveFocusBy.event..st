event handling
moveFocusBy: aPoint event: anEvent
	"This method is called in interactive solving mode on a mouse enter event. It moves the keyboard focus to the current cell."
	| newFocusedCell textMorph |
	newFocusedCell := self sudokuModel sudokuGui cellAtX: self xCoord + aPoint x Y: self yCoord + aPoint y.
	newFocusedCell ifNil: [^ self].
	textMorph := newFocusedCell submorphs first.
	anEvent hand newKeyboardFocus: textMorph.
	textMorph
		handleInteraction: [textMorph editor mouseDown: anEvent]
		fromEvent: anEvent.