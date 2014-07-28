solving
checkStrategyForColumns
"This method searches for numbers that have only one possible cell in a column."
	1 to: candidates columnCount do:
		[:column | 1 to: 9 do: 
			[:number |	| index | 	
						index := self number: number hasOnePossibilityIn: (inputMatrix atColumn: column).
						(index = 0)
							ifFalse: [self removeCandidatesInCell: ((candidates atColumn: column) at: index) 
										hiddenSingle: number. 
									(highlightCandidates at: index at: column) add: number]]].