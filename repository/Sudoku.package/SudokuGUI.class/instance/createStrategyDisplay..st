initialization
createStrategyDisplay: anOrderedCollection

	strategyDisplay := SudokuStrategyDisplay new.
	strategyDisplay initializeStrategyTexts: anOrderedCollection.
	strategyDisplay highlightLine: 1.
	^strategyDisplay