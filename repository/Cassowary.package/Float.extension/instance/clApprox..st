*Cassowary
clApprox: aFloat
	"Answer true if I am approximately equal to the argument."
	| epsilon |

	epsilon := ClSimplexSolver epsilon * 100.
	self = 0.0 ifTrue: [^ aFloat abs < epsilon].
	aFloat = 0.0 ifTrue: [^ self abs < epsilon].
	^ (self - aFloat) abs < (self abs * epsilon)