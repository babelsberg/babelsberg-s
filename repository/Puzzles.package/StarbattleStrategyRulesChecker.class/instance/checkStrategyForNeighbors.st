solving
checkStrategyForNeighbors
"This method removes the 1 candidate in all neighboring cells of a star."
	self inputMatrix do: 
		[:cell | (cell isStar size = 1 and: [cell isStar first = 1])
					ifTrue: ["Remove all 1 candidates in the neighboring cells."
						self removeCandidateStarsFrom: cell neighbors]].