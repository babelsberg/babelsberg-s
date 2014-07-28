calculation
takeStep

	(currentState = 1)
		ifTrue: [self inHistoryMode
					ifTrue: [self calculationInHistoryMode]
					ifFalse: [self calculationInNormalMode 
								ifFalse: [^false]]].
	self updateState.
	^true