solving
checkStrategyForColumns
	1 to: inputMatrix columnCount do:
		[:column | | possibleCells listOfPairs | 
				possibleCells := self findCellsWithTwoPossibilitiesIn: (inputMatrix atColumn: column).
				listOfPairs := self searchForPairs: possibleCells.
				listOfPairs notEmpty
					ifTrue: [self removeCandidatesForPairs: listOfPairs in: (candidates atColumn: column)]]