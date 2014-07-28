instance creation
buildFromString: aString

	| numberList numbers numbersMatrix |
	numberList := OrderedCollection new.
	aString substrings
		collect: [:row | row do: [:digit | numberList add: digit digitValue]].
	numbers := Matrix new: 9 tabulate: [:i :j | numberList at: (j \\ 10 + (i-1*9))].
	
	numbersMatrix := self newFrom: numbers.

	numbersMatrix sudokuGui: SudokuGUI new.
	numbersMatrix sudokuGui updateCells: numbersMatrix ofType: #number.
	numbersMatrix sudokuGui setMatrixCoordinatesOfSudoku: numbersMatrix.
	numbersMatrix sudokuGui numbers: numbersMatrix.
	numbersMatrix sudokuGui createConstraintButtons.

	^ numbersMatrix