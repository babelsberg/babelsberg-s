*Constraints-Core
processReturnValueFromConstraintBlock: aReturnValue
	"If the returnValue is a constraint expression, add it to the current constraint. If it is a constraint value, which is from type #'Bool', make a constraint expression and add it to the constraint. If the returnValue is true, do nothing (e.g. [1=1] alwaysTrue). In all other cases, throw an error with the returnValue."
	<layer: #ccm>
	
	(aReturnValue isConstraintExpression 
	or: [true = aReturnValue] 
	or: [aReturnValue isConstraintVariable and: [aReturnValue type == #'Bool']])
		ifFalse: [self error: 'The constraint block did not return a constraint. Instead, it returned ', aReturnValue, '.'].

	aReturnValue isConstraintExpression 
		ifTrue: [aReturnValue addExpressionToConstraint:  self currentConstraint.]
		ifFalse: [(aReturnValue isConstraintVariable and: [aReturnValue type == #'Bool'])
					ifTrue: [(aReturnValue = true) addExpressionToConstraint:  self currentConstraint]].
