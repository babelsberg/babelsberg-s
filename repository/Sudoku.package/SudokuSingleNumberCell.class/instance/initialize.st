initialization
initialize
	"This method initializes all 81 Sudoku cells."
	super initialize.
	self initializeCellSize: 77 
		 textSize: 36 
		 updateColor: Color blue 
		 normalColor: Color black 
		 highlightColor: Color green 
		 removeColor: Color blue. 
	self 
		borderWidth: 1.