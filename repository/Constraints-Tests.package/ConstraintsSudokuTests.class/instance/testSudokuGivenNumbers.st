testing
testSudokuGivenNumbers

	| sudoku solver numberOfDefinedCells |
	sudoku := SudokuGrid buildFromString: SudokuGrid defaultInputFile.
	solver := ConstraintSolver newZ3Solver.
	solver variableType: #'Int'.

	numberOfDefinedCells := 0.
	sudoku do: [:each | each ~= 0 ifTrue: [numberOfDefinedCells := numberOfDefinedCells + 1]].

	self shouldnt: [sudoku withIndicesDo: [:val :row :column | val ~= 0 ifTrue: [[(sudoku at: row at: column) = val] alwaysSolveWith: solver]]] raise: Error.
	self should: [solver constraints size = numberOfDefinedCells].
