private
process: aProcess controller: aController context: aContext
	| aConstraintSolver constraint solvers |
	solvers := ConstraintSolver class organization listAtCategoryNamed: #'instance creation'.
	aConstraintSolver := ConstraintSolver perform: (UIManager default chooseFrom: solvers values: solvers title: 'Which solver?').
	constraint := aConstraintSolver class constraintClass new
					constraintBlock: self;
					priority: ConstraintPriority required;
					solver: aConstraintSolver;
					yourself.
	Processor activeProcess environmentAt: #constraintObject put: constraint.
	^ super process: aProcess controller: aController context: aContext