testing
weighted1

"
	| c |
	c := ClCassowaryTester new.
	c haltFirst: false.
	c weighted1.
"

	| x solver result c15 c20 |

	haltFirst ifTrue: [self halt].

	x := ClVariable new name: 'x'.

	solver := ClSimplexSolver new.
	c15 := x cnEqual: 15.0 strength: ClStrength weak.
	c20 := x cnEqual: 20.0 strength: ClStrength weak weight: 2.
	solver addConstraint: c15.
	result := x value clApprox: 15.0.
	solver addConstraint: c20.
	result := result & (x value clApprox: 20.0).
	solver removeConstraint: c20.
	result := result & (x value clApprox: 15.0).

	Transcript cr; 
		show: 'ClCassowaryTester weighted1 result='; 
		show: (result ifTrue: ['passed'] ifFalse: ['failed']); 
		cr.