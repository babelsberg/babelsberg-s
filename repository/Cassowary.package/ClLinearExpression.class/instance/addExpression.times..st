manipulation
addExpression: expr times: n
	"Add n * expr to this expression.

	expr	<ClLinearExpression>
	n		<Number>"

	self incrementConstant: n * expr constant.
	expr terms keysAndValuesDo: [:v :c |
		self addVariable: v coefficient: n*c]