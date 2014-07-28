solving
checkStrategyForBoxes
"(i,j) are the indices of the top left cells in each box."
	1 to: 9 by: 3 do:
		[:i | 1 to: 9 by: 3 do:
			[:j | self checkConstraintForBoxAt: i at: j]].