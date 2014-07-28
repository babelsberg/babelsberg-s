converting
transformCandidateToSingleNumber: aNumber
	| singleNumber |
	singleNumber := SudokuSolvedCell new.
	aNumber ~= 0 ifTrue: [singleNumber submorphs first updateColor: Color black].
	singleNumber updateContent: aNumber ofType: #number.
	
	owner := self owner replaceSubmorph: self by: singleNumber.
	self delete.