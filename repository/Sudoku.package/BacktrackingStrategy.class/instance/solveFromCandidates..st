as yet unclassified
solveFromCandidates: aMatrix
"The method returns false if the given matrix is not a valid Sudoku grid"
	| inputMatrix |
	(SudokuStrategyRulesChecker finished: aMatrix) ifTrue: [^true].   
	(SudokuStrategyRulesChecker isValid: aMatrix) ifFalse: [^false].   
	inputMatrix := SudokuGrid newFrom: aMatrix. 
	aMatrix withIndicesDo: [:candidates :x :y |
		(candidates size > 1 and: [candidates size < 5])
			ifTrue: ["test all cases"
				candidates do: [:testCandidate | | newGrid attempt rules |
					newGrid := SudokuGrid newFrom: aMatrix.
					(newGrid at: x at: y) removeAll; add: testCandidate.
					rules := SudokuStrategyRulesChecker new. 
					rules solveFromCandidates: newGrid.
					newGrid := rules candidates.
					attempt := BacktrackingStrategy new solveFromCandidates: newGrid.
					attempt 
						ifFalse: [(inputMatrix at: x at: y) remove: testCandidate]
						ifTrue: [^true]].
				^BacktrackingStrategy new solveFromCandidates: inputMatrix]].
	^ true