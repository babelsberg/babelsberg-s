solving
checkStrategyForRows
"This method searches for pairs that have only two possible cells in a row."
	1 to: inputMatrix rowCount do:
		[:row | 	| numberIndex pairsDict |
				numberIndex := self indecesPerNumberIn: (inputMatrix atRow: row).  
				pairsDict := numberIndex select: [:each | each size = 2 and: [(numberIndex values occurrencesOf: each) > 1]].
				pairsDict size > 2 ifTrue: [^self]. "not yet implemented"
				pairsDict ifNotEmpty: [ | highlight |
						highlight := false.
						pairsDict values first do: [:index |
						((candidates atRow: row) at: index) size > 2
							ifTrue: [solvedCells := true. highlight := true].
						(candidates at: row at: index) removeAllSuchThat: [:number | (pairsDict keys includes: number) not]].
						highlight ifTrue: [
							(highlightCandidates at: row at: (pairsDict values first at: 1)) addAll: pairsDict keys.
							(highlightCandidates at: row at: (pairsDict values first at: 2)) addAll: pairsDict keys]]].