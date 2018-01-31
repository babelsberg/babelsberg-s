*Constraints-Core
removeCurrentConstraintIn: aProcess

	aProcess environmentRemoveKey: #constraintObject ifAbsent: ["Ignore if someone cleared that eagerly"]