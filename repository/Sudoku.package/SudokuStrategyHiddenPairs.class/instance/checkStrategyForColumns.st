solving
checkStrategyForColumns
"This method searches for pairs that have only two possible cells in a column."
	1 to: inputMatrix columnCount do:
		[:column| | numberIndex pairsDict |
				numberIndex := self indecesPerNumberIn: (inputMatrix atColumn: column).  
				pairsDict := numberIndex select: [:each | each size = 2 and: [(numberIndex values occurrencesOf: each) > 1]].
				pairsDict size > 2 ifTrue: [^self]. "not yet implemented"
				pairsDict ifNotEmpty: [ | highlight |
					highlight := false.
					pairsDict values first do: [:index |
						((candidates atColumn: column) at: index) size > 2
							ifTrue: [solvedCells := true. highlight := true]  .
						((candidates atColumn: column) at: index) removeAllSuchThat: [:number | (pairsDict keys includes: number) not]].
					highlight ifTrue: [
							(highlightCandidates at: (pairsDict values first at: 1) at: column) addAll: pairsDict keys.
							(highlightCandidates at: (pairsDict values first at: 2) at: column) addAll: pairsDict keys]]].