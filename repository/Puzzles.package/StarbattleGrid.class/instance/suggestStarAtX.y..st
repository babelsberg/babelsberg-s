solving
suggestStarAtX: x y: y

	| constraint |
	constraint := [(self at: x at: y) isStar = true] alwaysSolveWith: solver.
	(self at: x at: y) isStar
		ifFalse: [[solver solve] 
			ifError: [constraint disable. 
					ConstraintUnsatisfiableError new signal]].
	self equalityConstraints at: x at: y put: constraint.