manipulation
changeSubject: oldSubject newSubject: newSubject
	"This linear expression currently represents the equation oldSubject=self.  Destructively modify it so that it represents the equation newSubject=self.

	Precondition: newSubject currently has a nonzero coefficient in this expression.

	oldSubject	<ClAbstractVariable>
	newSubject	<ClAbstractVariable>

	Suppose this expression is c + a*newSubject + a1*v1 + ... + an*vn.
	Then the current equation is oldSubject = c + a*newSubject + a1*v1 + ... + an*vn.
	The new equation will be newSubject = -c/a + oldSubject/a - (a1/1)*v1 - ... - (an/a)*vn.
	Note that the term involving newSubject has been dropped."
	| reciprocal nreciprocal |

	"remove newSubject from my dictionary of terms, saving the reciprocal of its coefficient"
	reciprocal := (self terms removeKey: newSubject) reciprocal.
	nreciprocal := reciprocal negated.
	self constant: nreciprocal * self constant.
	self terms keysAndValuesDo: [:v :c | self terms at: v put: c * nreciprocal].
	self terms at: oldSubject put: reciprocal