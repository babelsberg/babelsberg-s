private
optimize: zVar
	"Minimize the value of the objective.  (The tableau should already be feasible.)
	
	zVar <ClObjectiveVariable>"
	| zRow minRatio exitVar entryVar r expr coeff |

	zRow := self rows at: zVar.
	[true] whileTrue: [
		"Find a variable in the objective function with a negative coefficient (ignoring dummy variables).
		  If all coefficients are positive we're done.  To implement Bland's anticycling rule, if there is 
		  more than one variable with a negative coefficient, pick the one with the smaller id (implemented as hash)."
		entryVar := nil.
		zRow variablesAndCoefficientsDo: [:v :c | 
			(v isPivotable and: [c definitelyNegative and: [entryVar isNil or: [v hash < entryVar hash]]]) ifTrue: [entryVar := v]].
		"if all coefficients were positive (or if the objective function has no pivotable variables) we are at optimum"
		entryVar isNil ifTrue: [^nil].
		"Choose which variable to move out of the basis.  Only consider pivotable basic variables (that is, restricted, non-dummy variables)."
		minRatio := nil.
		(self columns at: entryVar) do: [:v | v isPivotable ifTrue: [
			expr := self rows at: v.
			coeff := expr coefficientFor: entryVar.

			"only consider negative coefficients"
			coeff < 0.0 ifTrue: [
				r := (expr constant / coeff) negated.
				"Decide whether to make v be the best choice for exit variable so far by comparing the ratios.
				  In case of a tie, choose the variable with the smaller id (to implement Bland's anticycling rule)."
				(minRatio isNil or: [r<minRatio or: [r=minRatio and: [v hash < exitVar hash]]]) ifTrue: [
					minRatio := r.  exitVar := v]]]].
		"If minRatio is still nil at this point, it means that the objective function is unbounded, i.e. it can become arbitrarily negative.  This should never happen in this application."
		minRatio isNil ifTrue: [ClError internalError signal].
		self pivot: entryVar exitVar: exitVar]