*Constraints-Core
currentConstraintIn: aProcess

	(self hasCurrentConstraintIn: aProcess) ifFalse: [^ self error: 'No current constraint'].
	
	^ aProcess environmentAt: #constraintObject ifAbsent: ["should not be"].
