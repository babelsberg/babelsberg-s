solving
createConstraintAt: x at: y with: aValue
	"This method is called for new values. It creates the equality constraint for the new number and stores it. The method throws an error, if the constraints are unsatisfiable. An old value (and constraint) for the same cell will be overriden."
	| constraint |
	constraint := [(self at: x at: y) = aValue] alwaysSolveWith: solver.
	((self at: x at: y) = aValue)
		ifFalse: [self disableEqualityConstraintAt: x at: y.
				[solver solve] ifError: [constraint disable. ConstraintUnsatisfiableError new signal]].
	equalityConstraints at: x at: y put: constraint.