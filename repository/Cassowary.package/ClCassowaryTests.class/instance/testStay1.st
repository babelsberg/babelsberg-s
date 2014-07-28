tests
testStay1

"
	| c |
	c := ClCassowaryTests new.
	c haltFirst: false.
	c testStay1.
"

	| x solver stay |

	haltFirst ifTrue: [self halt].

	x := ClVariable newWith: 20.0 name: 'x'.

	"set up solver with a weak stay on x, required 10<=x<=100, and required x=2*y"
	solver := ClSimplexSolver new.
	stay := ClStayConstraint variable:  x strength: ClStrength weak.
	solver addConstraint: stay.
	self assert: (x value clApprox: 20.0).
	solver removeConstraint: stay