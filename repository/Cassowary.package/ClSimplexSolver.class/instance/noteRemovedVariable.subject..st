private
noteRemovedVariable: var subject: subject
	"Variable var has been removed from an expression.  If the expression is in a tableau the corresponding basic variable is subject (or if subject is nil then it's in the objective function).  Update the column cross-indices.

	var <ClAbstractVariable>
	subject <ClAbstractVariable | nil>"

	subject notNil ifTrue: [(self columns at: var) remove: subject]