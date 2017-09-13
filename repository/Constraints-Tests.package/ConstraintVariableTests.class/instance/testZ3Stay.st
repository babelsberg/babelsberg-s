testing
testZ3Stay
	
	| z3Var |
	z3Var := ConstraintZ3Variable new.
	z3Var 
		originalValue: 17;
		varValue: 17;
		solver: ConstraintSolver newZ3Solver;
		varName: 'x'.

	self should: [z3Var stayConstraint = nil].
	self shouldnt: [z3Var stay: ConstraintPriority required] raise: Error.
	self should: [z3Var value = 17].
	self should: [z3Var stayConstraint ~= nil].
	self should: [z3Var suggestValue: 23] raise: ConstraintUnsatisfiableError.