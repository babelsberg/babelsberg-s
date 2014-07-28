manipulation
addVariable: v coefficient: c
	"Add a term c*v to this expression.  If the expression already contains a term involving v, add c to the existing coefficient.  If the new coefficient is approximately 0, delete v.

	v		<ClVariable>
	c		<Number>"
	| newCoeff |

	(self terms includesKey: v)
		ifTrue: [
			newCoeff := c + (self terms at: v).
			(newCoeff clApproxZero)
				ifTrue: [
					self terms removeKey: v.
					^ self]
				ifFalse: [ self terms at: v put: newCoeff]]
		ifFalse: [self terms at: v put: c]