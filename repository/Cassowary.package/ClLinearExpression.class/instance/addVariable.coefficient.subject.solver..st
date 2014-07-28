manipulation
addVariable: v coefficient: c subject: subject solver: solver
	"Add a term c*v to this expression.  If the expression already contains a term involving v, add c to the existing coefficient.  If the new coefficient is approximately 0, delete v.  Notify the solver if v appears or disappears from this expression.

	v		<ClVariable>
	c		<Number>
	subject	<ClAbstractVariable>
	solver	<ClSimplexSolver>"
	| newCoeff |

	(self terms includesKey: v)
		ifTrue: [
			newCoeff := c + (self terms at: v).
			(newCoeff clApproxZero)
				ifTrue: [
					self terms removeKey: v.
					solver noteRemovedVariable: v subject: subject.
					^ self]
				ifFalse: [ self terms at: v put: newCoeff]]
		ifFalse: [
			self terms at: v put: c.
			solver noteAddedVariable: v subject: subject]