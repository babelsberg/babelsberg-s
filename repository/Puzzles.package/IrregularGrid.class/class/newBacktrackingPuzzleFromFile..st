instance creation
newBacktrackingPuzzleFromFile: aFileName

	| puzzle |
	puzzle := self newFromFile: aFileName.
	puzzle solver: StarbattleBacktrackingStrategy new..
	puzzle defineRegions.
	^ puzzle