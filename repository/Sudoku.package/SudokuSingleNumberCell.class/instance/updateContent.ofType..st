updating
updateContent: candidate ofType: aSymbol
	(aSymbol = #number)
		ifTrue: [self submorphs first updateTextWith: candidate; setToWhiteBackground].
	(aSymbol = #highlight)
		ifTrue: [self submorphs first setToNormalColor; setToHighlightColor].
	(aSymbol = #removeCandidates)
		ifTrue: [self submorphs first setToRemoveCandidatesColor].
	(aSymbol = #candidates)
		ifTrue: [self submorphs first setToWhiteBackground].  
	self changed.