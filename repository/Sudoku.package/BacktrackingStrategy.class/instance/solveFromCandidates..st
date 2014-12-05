as yet unclassified
solveFromCandidates: aMatrix
"The method returns false if the given matrix is not a valid Sudoku grid"
	(SudokuStrategyRulesChecker finished: aMatrix) ifTrue: [^ true].
	(SudokuStrategyRulesChecker isValid: aMatrix) ifFalse: [^ false]. 
	aMatrix withIndicesDo: [:candidates :x :y |
		(candidates size > 1 and: [candidates size < 5])
			ifTrue: ["test all cases"
				candidates do: [:testCandidate | | newGrid attempt rules |
					newGrid := SudokuGrid newFrom: aMatrix.
					(newGrid at: x at: y) removeAll; add: testCandidate.
					rules := SudokuStrategyRulesChecker new. 
					rules solveFromCandidates: newGrid.
					[rules solvedCells] whileTrue: [rules solveFromCandidates: newGrid].
					attempt := self class new solveFromCandidates: newGrid.
					attempt ifTrue: [^ true]].
				^ false]].
	^ false