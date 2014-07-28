solving
checkStrategyForRows
	1 to: inputMatrix rowCount do:
		[:row | | possibleCells listOfPairs | 
				possibleCells := self findCellsWithTwoPossibilitiesIn: (inputMatrix atRow: row).
				listOfPairs := self searchForPairs: possibleCells.
				listOfPairs notEmpty
					ifTrue: [self removeCandidatesForPairs: listOfPairs in: (candidates atRow: row)]]