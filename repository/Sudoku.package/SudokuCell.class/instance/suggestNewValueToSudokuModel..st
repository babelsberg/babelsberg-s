updating
suggestNewValueToSudokuModel: aValue

	self sudokuModel createConstraintAt: self xCoord at: self yCoord with: aValue.