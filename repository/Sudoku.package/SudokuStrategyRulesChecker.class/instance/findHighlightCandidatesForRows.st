solving
findHighlightCandidatesForRows	
	1 to: removeCandidates rowCount do:
		[:row | 	| allNumbers | 	
				allNumbers := (removeCandidates atRow: row) flatten asSet. 
				(inputMatrix atRow: row) 
					select: [:cellCandidates | cellCandidates size = 1 and: [allNumbers includes: cellCandidates first]]
					thenDo: [:highlightNumber | 
							highlightCandidates 
								at: row 
								at: ((inputMatrix atRow: row) indexOf: highlightNumber) 
								put: highlightNumber]].