solving
findHighlightCandidatesForBoxes
	1 to: inputMatrix boxCount do:
		[:boxIndex | | pairs | 
				pairs := OrderedCollection new.
				1 to: inputMatrix boxCount - 1 do:
					[:cellIndex | | candidateList cell |
							cell := SudokuGrid indexOfbox: boxIndex cell: cellIndex.
							candidateList := inputMatrix at: cell x at: cell y.
							candidateList size = 2
								ifTrue: [	(cellIndex+1 to: inputMatrix boxCount) 
											do: [:cellIndex2 | | cell2 |
															cell2 := SudokuGrid indexOfbox: boxIndex cell: cellIndex2.
															(candidateList includesAllOf: (inputMatrix at: cell2 x at: cell2 y))
																ifTrue: [pairs add: (OrderedCollection with: cellIndex with: cellIndex2)]]]].
				pairs do: 
					[:pairPositions | | pair | 
									pair := (inputMatrix atBox: boxIndex) at: (pairPositions at: 1).
									((removeCandidates atBox: boxIndex) contains: [:candidateList | candidateList includesAnyOf: pair])
										ifTrue: [ | firstPairIndex secondPairIndex |
												firstPairIndex := SudokuGrid indexOfbox: boxIndex cell: (pairPositions at: 1).
												secondPairIndex := SudokuGrid indexOfbox: boxIndex cell: (pairPositions at: 2).
												(highlightCandidates at: firstPairIndex x at: firstPairIndex y) add: (pair at: 1).
												(highlightCandidates at: firstPairIndex x at: firstPairIndex y) add: (pair at: 2).
												(highlightCandidates at: secondPairIndex x at: secondPairIndex y) add: (pair at: 1).
												(highlightCandidates at: secondPairIndex x at: secondPairIndex y) add: (pair at: 2)]]].