visual properties
highlightCandidates: aCollection
"aCollection contains all candidates that should be highlighted."
	aCollection do: 
		[:candidate | ((self submorphs at: candidate-1 \\ 3 + 1) 
								submorphs at: candidate-1 / 3 + 1) 
								updateContent: candidate ofType: #highlight].