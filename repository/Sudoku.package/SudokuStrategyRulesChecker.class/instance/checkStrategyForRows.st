solving
checkStrategyForRows
"This method searches all assigned numbers per row and removes this numbers in all other candidate lists in the row."
	1 to: inputMatrix rowCount do:
		[:row | |assignedNumbers| assignedNumbers := self collectAssignedNumbers: (inputMatrix atRow: row).
			self removeAssignedNumbers: assignedNumbers from: (inputMatrix atRow: row)].