solving
checkStrategyForColumns
"This method searchs for numbers that can only be in one box, if we look at a column"
	1 to: inputMatrix columnCount do:
		[:column | 	| numberIndex numbersForReduction |
					numberIndex := self indecesPerNumberIn: (inputMatrix atColumn: column).  
					numbersForReduction := numberIndex select: 
						[:each | each size > 1 and: [each allSatisfy: [:number | (number-1 // 3) = (each first - 1 // 3)]]].
					numbersForReduction associationsDo: [:each |  | highlight box indices |
						highlight := false.
						indices := OrderedCollection new.
						indices add: (SudokuGrid boxIndexFromCellIndex: each value first @ column).
						indices add: (SudokuGrid boxIndexFromCellIndex: each value second @ column).
						each value size = 3 ifTrue: [indices add: (SudokuGrid boxIndexFromCellIndex: each value third @ column)]. 
					
						box := candidates atBox: (SudokuGrid boxNumberFromIndex: each value first @ column).
						box withIndexDo: [:candidateList :index | 
							(indices includes: index)
								ifFalse: [
									(candidateList includes: each key) ifTrue: [solvedCells := true. highlight := true].
									candidateList remove: each key ifAbsent: []	]].
						
						highlight ifTrue: [each value do: [:index |((highlightCandidates atColumn: column) at: index) add: each key]]]]