solving
checkStrategyForRows
"This method searches for numbers that have only one possible cell in a row."
	1 to: candidates rowCount do:
		[:row | 1 to: 9 do: 
			[:number | 	| index | 	
						index := self number: number hasOnePossibilityIn: (inputMatrix atRow: row).
						(index = 0)
							ifFalse: [self removeCandidatesInCell: ((candidates atRow: row) at: index) 
										hiddenSingle: number. 
									(highlightCandidates at: row at: index) add: number]]].