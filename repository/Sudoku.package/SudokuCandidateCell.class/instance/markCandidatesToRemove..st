visual properties
markCandidatesToRemove: aCollection
	aCollection do: 
		[:candidate | ((self submorphs at: candidate-1 \\ 3 + 1) 
								submorphs at: candidate-1 / 3 + 1) 
								updateContent: candidate ofType: #removeCandidates].