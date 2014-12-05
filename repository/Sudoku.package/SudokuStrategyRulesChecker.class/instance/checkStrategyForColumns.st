solving
checkStrategyForColumns
"This method searches all assigned numbers per column and removes this numbers in all other candidate lists in the column."
	1 to: inputMatrix columnCount do:
		[:column | |assignedNumbers| 
			assignedNumbers := self collectAssignedNumbers: (inputMatrix atColumn: column).
			self removeAssignedNumbers: assignedNumbers from: (inputMatrix atColumn: column)].