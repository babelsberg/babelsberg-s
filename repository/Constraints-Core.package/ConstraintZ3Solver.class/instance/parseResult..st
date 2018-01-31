solving
parseResult: aString
	"Create a dictionary with the variable names and values from incoming string.."

	(aString beginsWith: 'sat') ifFalse: [ConstraintUnsatisfiableError new signal].

	^ aString lines allButFirst
		inject: Dictionary new
		into: [:dict :line | | parts name value stValue |
			parts := line findTokens: '( )'.
			name := parts first.
			"If the result is negative, we have to remove the blank between the - and the value"
			value := parts allButFirst join.
			stValue := 
				value = 'true' ifTrue: [true] 	ifFalse: [
				value = 'false' ifTrue: [false] ifFalse: [
				value asNumber]].
			dict
				at: name put: stValue;
				yourself]