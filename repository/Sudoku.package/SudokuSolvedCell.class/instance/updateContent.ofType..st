updating
updateContent: solvedNumber ofType: aSymbol
	(aSymbol = #number)
		ifTrue: [(solvedNumber = 0)
					ifTrue: [self submorphs first updateTextWith: '']
					ifFalse: [self submorphs first updateTextWith: solvedNumber]].
	(aSymbol = #highlight)
		ifTrue: [self submorphs first setToNormalColor.
				(solvedNumber notEmpty) 
					ifTrue: [self submorphs first setToHighlightColor]].
	(aSymbol = #removeCandidates)
		ifTrue: ["do nothing because here are no candidates"].
	(aSymbol = #candidates)
		ifTrue: ["In historyMode, it is possible that solvedNumber is a collection of multiple candidiates. In that case, transform the solved cell back into a candidate cell."
			(solvedNumber isCollection and: [solvedNumber size > 1]) 
				ifTrue: [self transformSolvedCellToCandidate: solvedNumber].  
			self submorphs first setToWhiteBackground].  
	self changed.