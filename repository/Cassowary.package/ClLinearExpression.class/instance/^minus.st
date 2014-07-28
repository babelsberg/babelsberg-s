manipulation
- x
	"Answer a new CLLinearExpression formed by subtracting x from self."
	| expr result |

	expr := x asLinearExpression.
	result := ClLinearExpression new.
	result constant: self constant - expr constant.
	self terms keysAndValuesDo: [:v :c | result terms at: v put: c].
	expr variablesAndCoefficientsDo: [:v :c | result addVariable: v coefficient: c negated].
	^ result