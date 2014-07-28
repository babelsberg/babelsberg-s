solving
checkStrategyForBoxes
"This method searchs for numbers that can only be in one row or column, if we look at one box"
	1 to: inputMatrix boxCount do: 
		[:box | 	| numberIndex pointingNumbersRow pointingNumbersColumn |
				numberIndex := self indecesPerNumberIn: (inputMatrix atBox: box).  
				pointingNumbersRow := numberIndex select: 
					[:each | each size > 1 and: [each allSatisfy: [:number | (number-1 // 3) = (each first - 1 // 3)]]].
				pointingNumbersColumn :=  numberIndex select: 
					[:each | each size > 1 and: [each allSatisfy: [:number | (number-1 \\ 3) = (each first - 1 \\ 3)]]].
				
				pointingNumbersRow associationsDo: [:each | | indices row highlight |
					highlight := false.
					indices := OrderedCollection new.
					indices add: (SudokuGrid indexOfbox: box cell: each value first) y.
					indices add: (SudokuGrid indexOfbox: box cell: each value second) y.
					each value size = 3 ifTrue: [indices add: (SudokuGrid indexOfbox: box cell: each value third) y].
					
					row := candidates atRow: (SudokuGrid indexOfbox: box cell: each value first) x.
					row withIndexDo: [:candidatesList :index |
						 (indices includes: index) ifFalse: [
							(candidatesList includes: each key) ifTrue: [solvedCells := true. highlight := true].  
							candidatesList remove: each key ifAbsent: []]].
					
					highlight ifTrue: [each value do: [:index |((highlightCandidates atBox: box) at: index) add: each key]]].
				
				pointingNumbersColumn associationsDo: [:each | | indices column highlight |
					highlight := false.
					indices := OrderedCollection new.
					indices add: (SudokuGrid indexOfbox: box cell: each value first) x.
					indices add: (SudokuGrid indexOfbox: box cell: each value second) x.
					each value size = 3 ifTrue: [indices add: (SudokuGrid indexOfbox: box cell: each value third) x].
					
					column := candidates atColumn: (SudokuGrid indexOfbox: box cell: each value first) y.
					column withIndexDo: [:candidatesList :index |
						 (indices includes: index) ifFalse: [
							(candidatesList includes: each key) ifTrue: [solvedCells := true. highlight := true].  
							candidatesList remove: each key ifAbsent: []]].
					
					highlight ifTrue: [each value do: [:index |((highlightCandidates atBox: box) at: index) add: each key]]].
		]