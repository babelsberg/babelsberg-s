updating
updateContent: content ofType: aSymbol
	(aSymbol = #number and: [(content ~= '')])
		ifTrue: [self transformCandidateToSingleNumber: content].
	(aSymbol = #candidates)
		ifTrue: [self updateCandidates: content].
	(aSymbol = #highlight)
		ifTrue: [self highlightCandidates: content].
	(aSymbol = #removeCandidates)
		ifTrue: [self markCandidatesToRemove: content].
	self changed.