solving
checkStrategyForBoxAt: i at: j
	| box listOfPairs possiblePairs |
	box := self getBoxCellsAt: i at: j in: inputMatrix. 
	possiblePairs := self findCellsWithTwoPossibilitiesIn: box.
	listOfPairs := self searchForPairs: possiblePairs.
	listOfPairs notEmpty
		ifTrue: [self removeCandidatesForPairs: listOfPairs in: (self getBoxCellsAt: i at: j in: candidates)].