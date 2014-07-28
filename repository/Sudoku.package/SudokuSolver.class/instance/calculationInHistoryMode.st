calculation
calculationInHistoryMode

	self applyStrategyForCandidates: (candidatesHistory at: historyPosition).
	historyPosition := historyPosition + 1.
	historySlider relativeValue: historyPosition