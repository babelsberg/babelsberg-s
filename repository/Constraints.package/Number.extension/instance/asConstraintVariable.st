*Constraints
asConstraintVariable

	^ (Processor activeProcess environmentAt: #constraintObject) solver class constraintVariableFor: self