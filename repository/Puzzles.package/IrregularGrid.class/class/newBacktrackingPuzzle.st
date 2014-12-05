instance creation
newBacktrackingPuzzle

	| puzzle |
	puzzle := self buildFromString: self defaultInputFile.
	puzzle solver: StarbattleBacktrackingStrategy new..
	puzzle defineRegions.
	^ puzzle