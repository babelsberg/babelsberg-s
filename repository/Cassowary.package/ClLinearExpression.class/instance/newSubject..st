manipulation
newSubject: subject
	"This linear expression currently represents the equation self=0.  Destructively modify it so that subject=self represents an equivalent equation.  Precondition: subject must be one of the variables in this expression.

	subject	<ClAbstractVariable>

	Suppose this expression is c + a*subject + a1*v1 + ... + an*vn, representing
	c + a*subject + a1*v1 + ... + an*vn = 0.
	The modified expression will be -c/a - (a1/a)*v1 - ... - (an/a)*vn, representing
	subject = -c/a - (a1/a)*v1 - ... - (an/a)*vn
	Note that the term involving subject has been dropped."
	| nreciprocal |

	nreciprocal := (self terms removeKey: subject) reciprocal negated.
	self constant: nreciprocal * self constant.
	self terms keysAndValuesDo: [:v :c | self terms at: v put: c*nreciprocal]	