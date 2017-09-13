testing
testZ3WeakStay
	"Z3 does not support weak stay constraints."
	| z3Var |
	z3Var := ConstraintZ3Variable new.
	z3Var 
		originalValue: 17;
		varValue: 17;
		solver: ConstraintSolver newZ3Solver;
		varName: 'x'.

	self should: [z3Var stayConstraint = nil].
	self should: [z3Var stay: ConstraintPriority low] raise: Error.
	self should: [z3Var stayConstraint = nil].
	self shouldnt: [z3Var suggestValue: 23] raise: Error.