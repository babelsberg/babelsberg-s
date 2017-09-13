running
setUp

	| wrappers |
	ConstraintSolver cassowarySolver removeAllConstraints.

	[wrappers := ExampleClass methodDict values select: [:method | method isMwMethodWrapper]. 
	wrappers do: [:w | w uninstall]] doWhileFalse: [wrappers isEmpty].