testing
testMultipleSudokuRows

	| sudoku solver |
	sudoku := SudokuGrid newFromFile: 'sudoku.txt'.
	solver := ConstraintSolver newZ3Solver.
	solver variableType: 'Int'.

	(1 to: 3) do: [:index |
		self shouldnt: [[(sudoku atRow: index) allDifferent] alwaysSolveWith: solver] raise: Error.
		self shouldnt: [[(sudoku atRow: index) allSatisfy: [:each | each >= 1 & (each <= 9)]] alwaysSolveWith: solver] raise: Error].

	(1 to: 3) do: [:index |
		self should: [(sudoku atRow: index) asSet size = 9].
		self should: [(sudoku atRow: index) allSatisfy: [:each | each >= 1 & (each <= 9)]].
		self should: [(sudoku atRow: index) allSatisfy: [:each | each isInteger]]].