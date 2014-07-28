testing
addDelete3

"
	| c |
	c := ClCassowaryTester new.
	c haltFirst: false.
	c addDelete3.
"

	| x solver result c1 c2 |

	haltFirst ifTrue: [self halt].

	x := ClVariable new name: 'x'.

	solver := ClSimplexSolver new.
	c1 := (x cnEqual: 100.0 strength: ClStrength weak weight: 5).  "notice weight=5 for this one"
	c2 := (x cnEqual: 200.0 strength: ClStrength weak).
	solver addConstraint: c1; addConstraint: c2.
	result := (x value clApprox: 100.0).
	solver removeConstraint: c1.
	result := result & (x value clApprox: 200.0).

	Transcript cr; 
		show: 'ClCassowaryTester addDelete3 result='; 
		show: (result ifTrue: ['passed'] ifFalse: ['failed']); 
		cr.