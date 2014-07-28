manipulation
* x
	"Answer a new CLLinearExpression formed by multiplying self by x.  (Note that this result must be linear.)"
	| expr n result |

	"If this expression is just a constant then we can just multiply by it..."
	self isConstant ifTrue: [^ x * self constant].

	"otherwise multipy by x"
	x isNumber 
		ifTrue: [n := x asFloat]
		ifFalse: [
			expr := x asLinearExpression.
			expr isConstant ifFalse: [ClError nonlinear signal "result would be non-linear"].
			n := expr constant].
	result := ClLinearExpression new.
	result constant: n * self constant.
	self terms keysAndValuesDo: [:v :c | result terms at: v put: n*c].
	^ result