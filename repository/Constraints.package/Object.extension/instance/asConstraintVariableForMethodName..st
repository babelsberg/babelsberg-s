*Constraints-Core
asConstraintVariableForMethodName: aName

	^ (Processor activeProcess environmentAt: #constraintObject) solver class constraintVariableFor: self withName: aName