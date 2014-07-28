instance creation
newFromFile: aFileName
	"The given file should include the sums of the four borders. The order is top, bottom, left, right. The sums are read from left to right or top to bottom. All Sudoku cells are assumed to be empty."
	| inputString file |
	file := MultiByteFileStream fileNamed: aFileName.
	inputString := file upToEnd.
	file close.
	^ self buildFromString: inputString