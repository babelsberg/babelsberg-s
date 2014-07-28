tests
testInconsistent1

"
	| c |
	c := ClCassowaryTests new.
	c haltFirst: false.
	c testInconsistent1.
"

	"inconsistent constraints:
		req'd	x=10
		req'd	x=5
	"

	| x solver |

	haltFirst ifTrue: [self halt].

	x := ClVariable new name: 'x'.

	solver := ClSimplexSolver new.
	solver addConstraint: (x cnEqual: 10.0).
	self should: [solver addConstraint: (x cnEqual: 5.0)] raise: ClError