solving
createSumConstraints
	"This method creates all sum constraints of an OusideSumSudoku. Each field outside the border defines the sum of the first three digits from that direction."

	(1 to: 9) do: [:i |
		[(self firstThreeCellsFrom: 1@(i) direction: 1@0) sum = (self topSums at: i) value] 
			alwaysSolveWith: solver.
		[(self firstThreeCellsFrom: 9@(i) direction: -1@0) sum = (self bottomSums at: i) value] 
			alwaysSolveWith: solver.
		[(self firstThreeCellsFrom: (i)@1 direction: 0@1) sum = (self leftSums at: i) value] 
			alwaysSolveWith: solver.
		[(self firstThreeCellsFrom: (i)@9 direction: 0@(-1)) sum = (self rightSums at: i) value] 
			alwaysSolveWith: solver.].