solving
findHighlightCandidatesForColumns
	1 to: removeCandidates columnCount do:
		[:column | | allNumbers | 	
				allNumbers := (removeCandidates atColumn: column) flatten asSet. 
				(inputMatrix atColumn: column) 
					select: [:cellCandidates | cellCandidates size = 1 and: [allNumbers includes: cellCandidates first]]
					thenDo: [:highlightNumber | 
							highlightCandidates 
								at: ((inputMatrix atColumn: column) indexOf: highlightNumber) 
								at: column
								put: highlightNumber]].