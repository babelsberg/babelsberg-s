stepping and presenter
step

	super step.
	state ifTrue: [sudokuSolver takeStep
					ifFalse: [self playOrPause]].