solving
checkStrategyForRows
"This method searchs for numbers that can only be in one box, if we look at a row"
	1 to: inputMatrix rowCount do:
		[:row | 	| numberIndex numbersForReduction |
				numberIndex := self indecesPerNumberIn: (inputMatrix atRow: row).  
				numbersForReduction := numberIndex select: 
					[:each | each size > 1 and: [each allSatisfy: [:number | (number-1 // 3) = (each first - 1 // 3)]]].
				numbersForReduction associationsDo: [:each |  | highlight box indices |
					highlight := false.
					indices := OrderedCollection new.
					indices add: (SudokuGrid boxIndexFromCellIndex: row @ each value first).
					indices add: (SudokuGrid boxIndexFromCellIndex: row @ each value second).
					each value size = 3 ifTrue: [indices add: (SudokuGrid boxIndexFromCellIndex: row @ each value third)]. 
					
					box := candidates atBox: (SudokuGrid boxNumberFromIndex: row @ each value first).
					box withIndexDo: [:candidateList :index | 
						(indices includes: index)
							ifFalse: [
								(candidateList includes: each key) ifTrue: [solvedCells := true. highlight := true].
								candidateList remove: each key ifAbsent: []	]].
						
					highlight ifTrue: [each value do: [:index |((highlightCandidates atRow: row) at: index) add: each key]]].
					]