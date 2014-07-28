initialization
createCellsFrom: aMorph
	"This method creates all sudoku cells. Each cell is like the given morph."
	| box |
	
	box := SudokuBuilder createBoxFromMorph: aMorph copy.
	box borderWidth: 2.
	^ (SudokuBuilder createBoxFromMorph: box)