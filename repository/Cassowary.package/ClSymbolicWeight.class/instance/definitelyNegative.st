operations
definitelyNegative
	"return true if this symbolic weight is negative.  Allow coefficients that are within epsilon of
		0 to count as 0"
		| a epsilon nepsilon |
	epsilon := ClSimplexSolver epsilon.
	nepsilon := 0.0 - epsilon.
	1 to: self size do: [:i | 
		a := self at: i.  
		a<nepsilon ifTrue: [^true].
		a>epsilon ifTrue: [^false]].
	^false
