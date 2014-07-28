updating
updateCandidates: aCollection
	self submorphs do:
		[:threeCandidates | threeCandidates submorphs do:
			[:candidate | candidate updateContent: ' ' ofType: #number]].
	
	aCollection do: 
		[:candidate | ((self submorphs at: candidate-1 \\ 3 + 1) 
								submorphs at: candidate-1 / 3 + 1) 
								updateContent: candidate ofType: #number].