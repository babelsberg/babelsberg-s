*Constraints-Core
currentConstraint: aConstraint in: aProcess

	aConstraint isConstraint ifFalse: [^ self error: 'sorry, this is not a constraint: ', aConstraint asString].

	(self hasCurrentConstraintIn: aProcess) ifTrue: [^ self error: 'A constraint is already active'].

	aProcess environmentAt: #constraintObject put: aConstraint.
