*Cassowary
definitelyNegative
	"return true if I am definitely negative (i.e. smaller than negative epsilon)"
	^ self < (0.0 - ClSimplexSolver epsilon)