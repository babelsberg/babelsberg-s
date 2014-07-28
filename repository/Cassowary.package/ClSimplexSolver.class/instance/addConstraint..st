manipulating
addConstraint: aClLinearConstraint
	"Add aClLinearConstraint to the tableau"
	| expr |

	"Make a new linear expression representing the constraint, replacing any basic variables with their defining expressions, and adding slack and error variables as needed.  Also add error variables to the objective function, and index the constraint with its marker variable."
	expr := self makeExpression: aClLinearConstraint.

	"If possible, add expr directly to the appropriate tableau by choosing a subject for expr (a variable to become basic) from amongst the current variables in expr.  If this doesn't work, use an artificial variable.  After adding expr, re-optimize"
	(self tryAddingDirectly: expr) ifFalse: [self addWithArtificialVariable: expr].
	self autoSolve ifTrue: [
		self optimize: self objective.
		self setExternalVariables]
