instance creation
newConstrainedPuzzle

	| puzzle |
	puzzle := self buildFromString: self defaultInputFile.
	puzzle createConstraints.
	puzzle irregularPuzzleGui openInWorld.
	^ puzzle