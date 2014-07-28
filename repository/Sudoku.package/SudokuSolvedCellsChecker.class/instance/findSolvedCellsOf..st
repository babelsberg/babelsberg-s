solving
findSolvedCellsOf: aMatrix
"This method finds all lists of candidates that contain only one number."
	| numbers |
	numbers := Matrix new: aMatrix rowCount.
	1 to: aMatrix rowCount do:
		[:i | 1 to: aMatrix columnCount do: 
			[:j | ((aMatrix at: i at: j) size == 1)
				ifTrue: [numbers at: i at: j put: ((aMatrix at: i at: j) first)] ]].
	^ numbers