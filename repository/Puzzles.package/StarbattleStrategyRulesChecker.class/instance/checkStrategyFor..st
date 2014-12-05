solving
checkStrategyFor: aCollection
"This method checks, whether aCollection has only two possible stars. Then, it sets the stars and removes the stars (repesented by a 1) in all other cells."
	| cellsWithPossibleStar | 
	cellsWithPossibleStar := aCollection select: [:cell | cell isStar includes: 1].
	cellsWithPossibleStar size = 2
		ifTrue: ["The row has only two possible cells for a star, so remove the 0 candidate."
				(cellsWithPossibleStar anySatisfy: [:cell | cell isStar size > 1])
					ifTrue: [self solvedCells: true].
				cellsWithPossibleStar do: [:cell | cell isStar remove: 0 ifAbsent: []]]
		ifFalse: [(cellsWithPossibleStar count: [:cell | cell isStar size = 1]) = 2
					ifTrue: ["The row already has two stars, so remove the 1 candidate from all other cells."
						self removeCandidateStarsFrom: aCollection]].