solving
checkStrategyForBoxes
"This method searches for pairs that have only two possible cells in a box."
	1 to: inputMatrix boxCount do:
		[:box| | numberIndex pairsDict |
				numberIndex := self indecesPerNumberIn: (inputMatrix atBox: box).  
				pairsDict := numberIndex select: [:each | each size = 2 and: [(numberIndex values occurrencesOf: each) > 1]].
				pairsDict size > 2 ifTrue: [^self]. "not yet implemented"
				pairsDict ifNotEmpty: [ | highlight |
					highlight := false.
					pairsDict values first do: [:index |
						((candidates atBox: box) at: index) size > 2
							ifTrue: [solvedCells := true. highlight := true]  .
						((candidates atBox: box) at: index) removeAllSuchThat: [:number | (pairsDict keys includes: number) not]].
					highlight ifTrue: [
							((highlightCandidates atBox: box) at: (pairsDict values first at: 1)) addAll: pairsDict keys.
							((highlightCandidates atBox: box) at: (pairsDict values first at: 2)) addAll: pairsDict keys]]].