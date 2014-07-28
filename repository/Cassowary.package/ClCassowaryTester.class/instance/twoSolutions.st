testing
twoSolutions

"
	| c |
	c := ClCassowaryTester new.
	c haltFirst: false.
	c twoSolutions.
"

	"
		req'd   x<=y
		req'd   y=x+3
 		weak   x=10
		weak   y=10

		The solution is x=7, y=10  or x=10, y=13 "

	| x y solver result |

	haltFirst ifTrue: [self halt].

	x := ClVariable new name: 'x'.
	y := ClVariable new name: 'y'.

	solver := ClSimplexSolver new.
	solver addConstraint: (x cnLEQ: y).
	solver addConstraint: (y cnEqual: x+3.0).
	solver addConstraint: (x cnEqual: 10.0 strength: ClStrength weak).
	solver addConstraint: (y cnEqual: 10.0 strength: ClStrength weak).

	result :=
		(x value clApprox: 10.0) & (y value clApprox: 13.0)
			or: [	(x value clApprox: 7.0) & (y value clApprox: 10.0) ].

	Transcript cr; 
		show: 'ClCassowaryTester twoSolutions result='; 
		show: (result ifTrue: ['passed'] ifFalse: ['failed']); 
		cr.