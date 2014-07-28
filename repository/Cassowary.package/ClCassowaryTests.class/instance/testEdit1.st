tests
testEdit1

"
	| c |
	c := ClCassowaryTests new.
	c haltFirst: false.
	c testEdit1.
"

	| x y solver result  |

	haltFirst ifTrue: [self halt].

	x := ClVariable newWith: 20.0 name: 'x'.
	y := ClVariable newWith: 30.0 name: 'y'.

	"set up solver with a weak stay on x, required 10<=x<=100, and required x=2*y"
	solver := ClSimplexSolver new.
	solver addConstraint: (ClStayConstraint variable:  x strength: ClStrength weak).
	solver addConstraint: (x cnGEQ: 10); addConstraint: (x cnLEQ: 100).
	solver addConstraint: (x cnEqual: y*2).
	result := (x value clApprox: 20.0) & (y value clApprox: 10.0).

	"now edit y"
	solver addEditVar: y strength: ClStrength strong.
	solver beginEdit.
	solver suggestValue: y newValue: 35.0.
	solver resolve.
	self assert: result & (x value clApprox: 70.0) & (y value clApprox: 35.0).
	solver suggestValue: y newValue: 80.0.   "this is bigger than y can be"
	solver resolve.
	self assert: result & (x value clApprox: 100.0) & (y value clApprox: 50.0).
	solver suggestValue: y newValue: 25.0.
	solver resolve.
	self assert: result & (x value clApprox: 50.0) & (y value clApprox: 25.0).

	solver endEdit.
	"x and y shouldn't change"
	self assert: result & (x value clApprox: 50.0) & (y value clApprox: 25.0).

	"edit x"
	solver addEditVar:x strength: ClStrength strong.
	solver beginEdit.
	solver suggestValue: x newValue: 44.0.
	solver resolve.
	self assert: result & (x value clApprox: 44.0) & (y value clApprox: 22.0).
	solver endEdit