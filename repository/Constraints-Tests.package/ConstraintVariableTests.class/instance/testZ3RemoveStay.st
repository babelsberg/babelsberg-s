testing
testZ3RemoveStay
	
	| z3Var solver |
	solver := ConstraintSolver newZ3Solver.
	z3Var := ConstraintZ3Variable new.
	z3Var 
		originalValue: 17;
		varValue: 17;
		solver: solver;
		varName: 'x'.

	self should: [z3Var stayConstraint = nil].
	self shouldnt: [z3Var stay: ConstraintPriority required] raise: Error.
	self should: [z3Var value = 17].
	self should: [z3Var stayConstraint ~= nil].
	self should: [z3Var suggestValue: 23] raise: ConstraintUnsatisfiableError.

	self shouldnt: [z3Var removeStay] raise: Error.
	self should: [z3Var stayConstraint = nil].
	self shouldnt: [z3Var suggestValue: 23] raise: Error.

	self shouldnt: [solver addStay: z3Var] raise: Error.
	self should: [z3Var value = 23].
	self should: [z3Var stayConstraint ~= nil].
	self should: [z3Var suggestValue: 17] raise: ConstraintUnsatisfiableError.