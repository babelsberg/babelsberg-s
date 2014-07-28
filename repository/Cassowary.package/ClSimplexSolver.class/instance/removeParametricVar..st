private
removeParametricVar: var
	"Remove the parametric variable var, updating the appropriate column and row entries.
	
	var <ClAbstractVariable>"
	| set |
	
	set := self columns removeKey: var.
	set do: [:v | (self rows at: v) terms removeKey: var]