testing
testSudokuRowIncludesAll

	| sudoku solver interval |
	sudoku := SudokuGrid buildFromString: SudokuGrid defaultInputFile.
	solver := ConstraintSolver newZ3Solver.
	solver variableType: #'Int'.
	solver autoSolve: false.
	interval := 1 to: 9.

	self shouldnt: [[(sudoku atRow: 1) includesAllOf: interval] alwaysSolveWith: solver] raise: Error.
	self shouldnt: [[(sudoku atRow: 2) includesAllOf: interval] alwaysSolveWith: solver] raise: Error.
	self shouldnt: [solver solve] raise: Error.