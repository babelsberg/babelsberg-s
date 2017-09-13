solving
parseResult: aString
"This method parses the result string and returns a dictionary with the variable names and values."
	| variableDict |
	(aString beginsWith: 'sat')
		ifFalse: [ConstraintUnsatisfiableError new signal].

	variableDict := Dictionary new.
	(2 to: aString lines size) do: [:index | | line tmpArray varValue | 
		line := aString lines at: index.
		tmpArray := (line select: [:c | c ~= '(' asCharacter & (c ~= ')' asCharacter)]) substrings.
		"If the result is negative, we have to remove the blank between the - and the value"
		tmpArray size = 3
			ifTrue: [tmpArray at: 2 put: (tmpArray at: 2), (tmpArray at: 3)].
		varValue := tmpArray second.
		(varValue = 'true')
			ifTrue: [variableDict at: tmpArray first put: true]
			ifFalse: [(varValue = 'false')
				ifTrue: [variableDict at: tmpArray first put: false]
				ifFalse: [variableDict at: tmpArray first put: tmpArray second asNumber]]].
	^ variableDict