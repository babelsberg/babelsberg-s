*Constraints-Core
asConstraintVariable

	^ (Processor activeProcess environmentAt: #constraintObject) solver class constraintVariableFor: self