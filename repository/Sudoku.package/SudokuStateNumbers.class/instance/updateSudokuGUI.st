updating
updateSudokuGUI
	| numbers numbersAsString |
	
	numbers := sudokuSolver numbers.
	numbersAsString := Matrix new: 9.
	1 to: 9 do:
		[:i | 1 to: 9 do:
			[:j | ((numbers at: i at: j) == emptyCell)
					ifTrue: [numbersAsString at: i at: j put: '']
					ifFalse: [numbersAsString at: i at: j put: (numbers at: i at: j) asString] ]].
	
	sudokuGUI updateCells: numbersAsString ofType: #number.