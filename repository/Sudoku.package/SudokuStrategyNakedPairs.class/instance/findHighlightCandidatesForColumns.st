solving
findHighlightCandidatesForColumns
	1 to: inputMatrix columnCount do:
		[:column | | pairs | 
				pairs := OrderedCollection new.
				1 to: inputMatrix rowCount - 1 do:
					[:row | | candidateList |
							candidateList := inputMatrix at: row at: column.
							candidateList size = 2
								ifTrue: [	(row+1 to: inputMatrix rowCount) 
											do: [:row2 | (candidateList includesAllOf: (inputMatrix at: row2 at: column))
																ifTrue: [pairs add: (OrderedCollection with: row with: row2)]]]].
				pairs do: 
					[:pairPositions | | pair | 
									pair := inputMatrix at: (pairPositions at: 1) at: column.
									((removeCandidates atColumn: column) contains: [:candidateList | candidateList includesAnyOf: pair])
										ifTrue: [(highlightCandidates at: (pairPositions at: 1) at: column) add: (pair at: 1).
												(highlightCandidates at: (pairPositions at: 1) at: column) add: (pair at: 2).
												(highlightCandidates at: (pairPositions at: 2) at: column) add: (pair at: 1).
												(highlightCandidates at: (pairPositions at: 2) at: column) add: (pair at: 2)]]].