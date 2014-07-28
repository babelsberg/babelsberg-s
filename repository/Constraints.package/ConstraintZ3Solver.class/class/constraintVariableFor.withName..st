as yet unclassified
constraintVariableFor: aValue withName: aName

	(aValue isNumber or: [aValue isKindOf: Boolean])
		ifTrue: [^ ConstraintVariable newZ3VariableFor: aValue withName: aName].
	aValue ifNil: [^ nil].
	(aValue isKindOf: SequenceableCollection)
		ifTrue: [^ ConstraintArray withAll: aValue].
	^ aValue