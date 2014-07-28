instance creation
newConstrainedPuzzleFromFile: aFileName

	| puzzle |
	puzzle := self newFromFile: aFileName.
	puzzle createConstraints.
	puzzle irregularPuzzleGui openInWorld.
	^ puzzle