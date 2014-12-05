as yet unclassified
finished: aStarbattleGrid
"This method checks if the Starbattle grid is solved completely and correctly."
	(aStarbattleGrid allSatisfy: [:cell | cell isStar size = 1])  
		ifFalse: [^false]
		ifTrue: [^self isValid: aStarbattleGrid]    