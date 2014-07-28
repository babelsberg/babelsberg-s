testing
stay1

"
	| c |
	c := ClCassowaryTester new.
	c haltFirst: false.
	c stay1.
"

	| x solver result stay |

	haltFirst ifTrue: [self halt].

	x := ClVariable newWith: 20.0 name: 'x'.

	"set up solver with a weak stay on x, required 10<=x<=100, and required x=2*y"
	solver := ClSimplexSolver new.
	stay := ClStayConstraint variable:  x strength: ClStrength weak.
	solver addConstraint: stay.
	result := (x value clApprox: 20.0).
	solver removeConstraint: stay.

	Transcript cr; 
		show: 'ClCassowaryTester stay1 result='; 
		show: (result ifTrue: ['passed'] ifFalse: ['failed']); 
		cr.