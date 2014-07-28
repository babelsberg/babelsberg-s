private
dualOptimize
	"We have set new values for the constants in the edit constraints.  Re-optimize using the dual simplex algorithm."
	| zRow exitVar entryVar ratio r zc |

	zRow := self rows at: objective.
	[self infeasibleRows isEmpty] whileFalse: [
		exitVar := self infeasibleRows removeFirst.

		"exitVar might have become basic after some other pivoting, so allow for the case of its not being there any longer"
		self rows at: exitVar ifPresent: [:expr |
			"make sure the row is still not feasible"
			expr constant < 0.0 ifTrue: [
				ratio := nil.
				expr variablesAndCoefficientsDo: [:v :c |
					(c>0.0 and: [v isPivotable]) ifTrue: [
						zc := zRow terms at: v ifAbsent: [nil].
						r := zc isNil ifTrue: [ClSymbolicWeight zero] ifFalse: [zc/c].
						(ratio isNil or: [r < ratio or: [r=ratio and: [v hash < entryVar hash]]])  ifTrue: [entryVar := v.  ratio := r]]].
				ratio isNil ifTrue: [ClError internalError signal].
				self pivot: entryVar exitVar: exitVar]]]