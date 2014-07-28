manipulation
substituteOut: var expr: expr subject: subject solver: solver
	"Replace var with a symbolic expression expr that is equal to it.  If a variable has been added to this expression that wasn't therer before, or if a variable has been dropped from this expression because it now has a coefficient of 0, inform the solver.

	Precondition: var occurs with a nonzero coefficient in this expression

	var		<ClAbstractVariable>
	expr	<ClLinearExpression>
	subject	<ClAbstractVariable>
	solver	<ClSimplexSolver>"
	| multiplier |
	
	multiplier := self terms removeKey: var.
	self incrementConstant: multiplier * expr constant.
	expr terms keysAndValuesDo: [:v :c | | newCoeff oldCoeff |
		oldCoeff := self terms at: v ifAbsent: [nil].
		oldCoeff 
			ifNil: [
				self terms at: v put: multiplier * c.
				solver noteAddedVariable: v subject: subject]
			ifNotNil: [
				newCoeff := oldCoeff + (multiplier * c).
				(newCoeff clApproxZero)
					ifTrue: [
						self terms removeKey: v.
						solver noteRemovedVariable: v subject: subject]
					ifFalse: [self terms at: v put: newCoeff]]]