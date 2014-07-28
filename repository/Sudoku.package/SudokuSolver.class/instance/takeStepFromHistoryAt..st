calculation
takeStepFromHistoryAt: anInteger

	currentState := 3.
	historyPosition := anInteger.
	self 
		updateState; "set candidates"
		updateState. "set numbers"
	^true