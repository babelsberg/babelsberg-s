testing
testZ3VariablePrintDeclaration
	
	| z3IntVar z3RealVar z3BoolVar constraintZ3 |
	constraintZ3 := ConstraintZ3 new
						priority: ConstraintPriority required;
						solver: ConstraintSolver newZ3Solver;
						yourself.
	Processor activeProcess environmentAt: #constraintObject put: constraintZ3.

	z3IntVar := ConstraintZ3Solver constraintVariableFor: 17.
	z3IntVar varName: 'x'.
	self should: [z3IntVar printDeclaration = '(declare-fun x () Real)'].

	z3RealVar := ConstraintZ3Solver constraintVariableFor: 17.5.
	z3RealVar varName: 'y'.
	self should: [z3RealVar printDeclaration = '(declare-fun y () Real)'].

	z3BoolVar := ConstraintZ3Solver constraintVariableFor: true.
	z3BoolVar varName: 'z'.
	self should: [z3BoolVar printDeclaration = '(declare-fun z () Bool)'].