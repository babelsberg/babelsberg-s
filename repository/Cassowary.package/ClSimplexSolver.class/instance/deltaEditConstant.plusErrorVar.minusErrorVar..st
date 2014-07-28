private
deltaEditConstant: delta plusErrorVar: plusErrorVar minusErrorVar: minusErrorVar

	"first check if the plusErrorVar is basic"
	self rows at: plusErrorVar ifPresent: [:expr | 
		expr incrementConstant: delta.
		"error variables are always restricted -- so the row is infeasible if the constant is negative"
		expr constant < 0.0 ifTrue: [self infeasibleRows add: plusErrorVar].
		^nil].

	"check if minusErrorVar is basic"
	self rows at: minusErrorVar ifPresent: [:expr | 
		expr incrementConstant: delta negated.
		expr constant < 0.0 ifTrue: [self infeasibleRows add: minusErrorVar].
		^nil].

	"Neither is basic.  So they must both be nonbasic, and will both occur in exactly the same expressions.  Find all the expressions in which they occur by finding the column for the minusErrorVar (it doesn't matter whether we look for that one or for plusErrorVar).  Fix the constants in these expressions."
	(self columns at: minusErrorVar) do: [:basicVar || expr c |
		expr := self rows at: basicVar.
		c := expr coefficientFor: minusErrorVar.
		expr incrementConstant: c*delta.
		(basicVar isRestricted and: [expr constant < 0.0]) ifTrue: [self infeasibleRows add: basicVar]].