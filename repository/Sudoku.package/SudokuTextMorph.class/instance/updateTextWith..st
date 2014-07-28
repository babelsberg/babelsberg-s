event handling
updateTextWith: aValue

	(aValue = self text asString)
		ifTrue: [self setToNormalColor]
		ifFalse: [self 
					setNumericValue: aValue;
					setToUpdateColor].