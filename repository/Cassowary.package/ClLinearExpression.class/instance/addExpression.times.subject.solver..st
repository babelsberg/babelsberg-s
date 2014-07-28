manipulation
addExpression: expr times: n subject: subject solver: solver
	"Add n * expr to this expression.  Notify the solver if a variable is added or deleted from this expression.

	expr	<ClLinearExpression>
	n		<Number>
	subject	<ClAbstractVariable>
	solver	<ClSimplexSolver>"

	self incrementConstant: n * expr constant.
	expr terms keysAndValuesDo: [:v :c |
		self addVariable: v coefficient: n*c subject: subject solver: solver]