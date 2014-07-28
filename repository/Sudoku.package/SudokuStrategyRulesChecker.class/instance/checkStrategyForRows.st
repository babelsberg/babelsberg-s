solving
checkStrategyForRows
"This method searches all assigned numbers per row and removes this numbers in all other candidate lists in the row."
	1 to: candidates rowCount do:
		[:row | |assignedNumbers| assignedNumbers := self collectAssignedNumbers: (inputMatrix atRow: row).
			self removeAssignedNumbers: assignedNumbers from: (candidates atRow: row)].