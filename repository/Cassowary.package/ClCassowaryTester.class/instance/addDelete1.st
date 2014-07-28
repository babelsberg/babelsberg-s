testing
addDelete1

"
	| c |
	c := ClCassowaryTester new.
	c haltFirst: false.
	c addDelete1.
"

	| x solver result c10 c10again c20 |

	haltFirst ifTrue: [self halt].

	x := ClVariable new name: 'x'.

	solver := ClSimplexSolver new.
	solver addConstraint: (x cnEqual: 100.0 strength: ClStrength weak).
	c10 := x cnLEQ: 10.0.
	c20 := x cnLEQ: 20.0.
	solver addConstraint: c10; addConstraint: c20.
	result := (x value clApprox: 10.0).
	solver removeConstraint: c10.
	result := result & (x value clApprox: 20.0).
	solver removeConstraint: c20.
	result := result & (x value clApprox: 100.0).
	c10again := x cnLEQ: 10.0.
	solver addConstraint: c10; addConstraint: c10again.
	result := result & (x value clApprox: 10.0).
	solver removeConstraint: c10.
	result := result & (x value clApprox: 10.0).
	solver removeConstraint: c10again.
	result := result & (x value clApprox: 100.0).

	Transcript cr; 
		show: 'ClCassowaryTester addDelete1 result='; 
		show: (result ifTrue: ['passed'] ifFalse: ['failed']); 
		cr.