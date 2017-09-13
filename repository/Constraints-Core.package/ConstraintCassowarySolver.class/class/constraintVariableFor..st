as yet unclassified
constraintVariableFor: aValue

	aValue isNumber
		ifTrue: [^ ConstraintVariable newCassowaryVariableFor: aValue].
	(aValue isKindOf: SequenceableCollection)
		ifTrue: [^ ConstraintArray withAll: aValue].
	^ aValue