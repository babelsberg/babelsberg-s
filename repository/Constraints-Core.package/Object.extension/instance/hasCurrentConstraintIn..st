*Constraints-Core
hasCurrentConstraintIn: aProcess

	^ (aProcess environmentAt: #constraintObject ifAbsent: []) notNil