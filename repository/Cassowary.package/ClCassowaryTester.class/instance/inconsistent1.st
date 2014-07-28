testing
inconsistent1

"
	| c |
	c := ClCassowaryTester new.
	c haltFirst: false.
	c inconsistent1.
"

	"inconsistent constraints:
		req'd	x=10
		req'd	x=5
	"

	| x solver signalled |

	haltFirst ifTrue: [self halt].

	x := ClVariable new name: 'x'.

	solver := ClSimplexSolver new.
	solver addConstraint: (x cnEqual: 10.0).
	signalled := false.
	[solver addConstraint: (x cnEqual: 5.0)] 
		on: ClError 
		do: [:signal | signalled := true. signal return].

	Transcript cr; 
		show: 'ClCassowaryTester inconsistent1 result='; 
		show: (signalled ifTrue: ['passed'] ifFalse: ['failed']); 
		cr.