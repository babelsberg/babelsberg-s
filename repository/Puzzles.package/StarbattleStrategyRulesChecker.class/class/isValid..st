as yet unclassified
isValid: aStarbattleGrid
"This method checks the rules in a candidates grid."
	1 to: aStarbattleGrid rowCount do:	[:r |
		(self collectionIsValid: (aStarbattleGrid atRow: r))
			ifFalse: [^ false]].

	1 to: aStarbattleGrid columnCount do: [:c |
		(self collectionIsValid: (aStarbattleGrid atColumn: c))
			ifFalse: [^ false]].

	aStarbattleGrid regions do:	[:region |  
		(self collectionIsValid: region)
			ifFalse: [^ false]].

	aStarbattleGrid do: [:cell | 
		(cell isStar size = 1 and: [cell isStar first = 1])
			ifTrue: [cell neighbors do: [:neighbor | 
				(neighbor isStar size = 1 and: [neighbor isStar first = 1])
					ifTrue: ["two stars that touch each other" ^ false]]]].

	^ true