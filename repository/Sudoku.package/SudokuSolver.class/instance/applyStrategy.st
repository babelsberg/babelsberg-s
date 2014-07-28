calculation
applyStrategy
	strategies 
		detect: [:strategy | strategy solveFromCandidates: self candidatesFromStrategy] 
		ifFound: [:solvingStrategy | currentStrategy := solvingStrategy.
									Transcript show: currentStrategy description.
									strategyDisplay highlightLine: (strategies indexOf: currentStrategy).
									^true]
		ifNone: [Transcript show: 'No strategy found'.
				strategyDisplay stopHighlighting.
				^false]