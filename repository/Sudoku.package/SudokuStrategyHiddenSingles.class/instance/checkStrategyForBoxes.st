solving
checkStrategyForBoxes
"This method searches for numbers that have only one possible cell in a box. (i,j) are the indices of the top left cells in each box."
	1 to: 9 by: 3 do:
		[:i | 1 to: 9 by: 3 do:
			[:j | 1 to: 9 do:
				[:number | 	| index |  	
							index := self number: number hasOnePossibilityIn: (self getBoxCellsAt: i at: j in: inputMatrix ).
							(index = 0)
								ifFalse: [self removeCandidatesInCell: ((self getBoxCellsAt: i at: j in: candidates) at: index) 
											hiddenSingle: number.
										(highlightCandidates at: i+(index-1//3) at: j+(index-1\\3))add: number]]]].