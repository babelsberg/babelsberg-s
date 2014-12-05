solving
checkConstraintForBoxAt: i at: j
"This method searches all assigned numbers in the box at (i,j) and removes this numbers in all other candidate lists in the box."
	| assignedNumbers box |
	box := self getBoxCellsAt: i at: j in: inputMatrix.
	assignedNumbers := self collectAssignedNumbers: box.
	self removeAssignedNumbers: assignedNumbers from: (self getBoxCellsAt: i at: j in: inputMatrix).