other events
mouseUpInSlider: anEvent

	| indexOfHistory indexAsFloatStartingWith0|
	super mouseUpInSlider: anEvent.
	
	indexAsFloatStartingWith0 := value * (maxRelativeValue - 1).
	indexOfHistory := indexAsFloatStartingWith0 // 1 + 1.
	sudokuSolver takeStepFromHistoryAt: (indexOfHistory).
	self relativeValue: indexOfHistory