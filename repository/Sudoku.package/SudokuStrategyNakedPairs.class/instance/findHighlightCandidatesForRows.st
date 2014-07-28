solving
findHighlightCandidatesForRows
	1 to: inputMatrix rowCount do:
		[:row | | pairs | 
				pairs := OrderedCollection new.
				1 to: inputMatrix columnCount - 1 do:
					[:column | | candidateList |
							candidateList := inputMatrix at: row at: column.
							candidateList size = 2
								ifTrue: [	(column+1 to: inputMatrix columnCount) 
											do: [:column2 | (candidateList includesAllOf: (inputMatrix at: row at: column2))
																ifTrue: [pairs add: (OrderedCollection with: column with: column2)]]]].
				pairs do: 
					[:pairPositions | | pair | 
									pair := inputMatrix at: row at: (pairPositions at: 1).
									((removeCandidates atRow: row) contains: [:candidateList | candidateList includesAnyOf: pair])
										ifTrue: [(highlightCandidates at: row at: (pairPositions at: 1)) add: (pair at: 1).
												(highlightCandidates at: row at: (pairPositions at: 1)) add: (pair at: 2).
												(highlightCandidates at: row at: (pairPositions at: 2)) add: (pair at: 1).
												(highlightCandidates at: row at: (pairPositions at: 2)) add: (pair at: 2)]]].