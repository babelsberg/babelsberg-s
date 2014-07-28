tests
testInconsistent2

"
	| c |
	c := ClCassowaryTests new.
	c haltFirst: false.
	c testInconsistent2.
"

	"inconsistent constraints:
		req'd	x>=10
		req'd	x<=5
	"

	| x solver |

	haltFirst ifTrue: [self halt].

	x := ClVariable new name: 'x'.

	solver := ClSimplexSolver new.
	solver addConstraint: (x cnGEQ: 10.0).
	self should: [solver addConstraint: (x cnLEQ: 5.0)] raise: ClError