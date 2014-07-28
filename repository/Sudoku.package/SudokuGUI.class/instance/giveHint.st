solving
giveHint
	"This method sets one empty cell to a correct number and adds an equality constraint for it on the sudoku grid."
	| randomX randomY randomGenerator number textMorph |
	(sudokuCellDict values anySatisfy: [:cell | cell submorphs first asText string = ''])
		ifFalse: [self inform: 'There are no empty cells.'. ^ self].
	randomX := 1.
	randomY := 1.
	randomGenerator := Random new.
	textMorph := (sudokuCellDict at: randomX@randomY) submorphs first.
	[textMorph asText string = ''] 
		whileFalse: [randomX := randomGenerator nextInt: 9.
					randomY := randomGenerator nextInt: 9.
					textMorph := (sudokuCellDict at: randomX@randomY) submorphs first.].
	number := self numbers at: randomX at: randomY.
	self numbers createConstraintAt: randomX at: randomY with: number. "should not fail"
	textMorph updateColor: Color red.
	textMorph updateTextWith: number.