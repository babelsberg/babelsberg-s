solving
removeCandidateStarsFrom: aCollection
"This method removes the 1 from all candidateLists that have more than one element."
	aCollection do: [:cell | 
		(cell isStar size = 2)
			ifTrue: [cell isStar remove: 1. self solvedCells: true]].