updating
transformSolvedCellToCandidate: aCollection
	| cell |
	cell := SudokuCandidateCell new.
	cell updateCandidates: aCollection.
	
	owner := self owner replaceSubmorph: self by: cell.
	self delete.