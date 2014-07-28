calculation
updateState

	self currentState updateSudokuGUI.
	currentState := currentState \\ allStates size + 1. 
	self currentState setButtonName.