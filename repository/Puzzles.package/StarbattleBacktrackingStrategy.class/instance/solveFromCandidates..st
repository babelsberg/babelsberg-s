as yet unclassified
solveFromCandidates: aMatrix
"The method returns false if the given matrix is not a valid Sudoku grid"
	(StarbattleStrategyRulesChecker finished: aMatrix) ifTrue: ["aMatrix printGrid." ^ true].
	(StarbattleStrategyRulesChecker isValid: aMatrix) ifFalse: [^ false]. 
	aMatrix withIndicesDo: [:cell :x :y |
		(cell isStar size = 2)
			ifTrue: ["test star"
				(0 to: 1) do: [:candidate | | newGrid attempt rules |
					newGrid := StarbattleGrid newFrom: aMatrix.
					(newGrid at: x at: y) isStar remove: candidate.
					rules := StarbattleStrategyRulesChecker new. 
					rules solveFromCandidates: newGrid.
					[rules solvedCells] whileTrue: [rules solveFromCandidates: newGrid].
					attempt := self class new solveFromCandidates: newGrid.
					attempt ifTrue: [^ true]].
				^ false]].
	^ false