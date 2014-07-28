instance creation
new
	"This method creates a Sudoku cell that shows all candidates from 1 to 9."
	| candidateCell |
	candidateCell := SudokuSingleNumberCell new initializeCellSize: 25 textSize: 18 
													updateColor: Color black 
													normalColor: Color black
													highlightColor: Color green
													removeColor: (Color r: 1 g:0 b:0).
	^ self newFrom: ((SudokuBuilder createBoxFromMorph: candidateCell) borderWidth: 1)